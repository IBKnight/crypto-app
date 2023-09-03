import 'dart:convert';
import 'dart:async';

import 'package:crypto_app/common/api_config.dart';
import 'package:crypto_app/data/mappers/coin_list_mapper.dart';
import 'package:crypto_app/data/models/coin_details/coin_details_model.dart';
import 'package:crypto_app/data/models/coin_list/coin_list_model.dart';
import 'package:crypto_app/data/models/coin_list/ws/coin_list_upd.dart';
import 'package:crypto_app/domain/entities/coin_details/coin_details_entity.dart';
import 'package:crypto_app/domain/entities/coin_list/coin_list_entity.dart';
import 'package:crypto_app/domain/entities/coin_list/coin_list_info_entity.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketHandler {
  // static late WebSocketChannel channel;
  WebSocketChannel channel;

  Set<String> activeSubscriptions = {};
  bool isWebSocketConnected = false;

  WebSocketHandler()
      : channel = WebSocketChannel.connect(Uri.parse(ApiConfig.webSocketBase));

  Stream<CoinDetailsModel> get detailsStream =>
      channel.stream.asyncMap<CoinDetailsModel>((value) {
        var data = jsonDecode(value);
        if (data['type'] == 'ticker') {
          return CoinDetailsModel.fromJson(data);
        }
        return CoinDetailsModel(
            price: '0', dateTime: DateTime.fromMicrosecondsSinceEpoch(0));
      });

  Stream<List<CoinListEntity>> getCoinListStream(List<CoinListModel> coins) {
    final coinList = coins.map((coinModel) {
      return CoinsListMapper.toEntity(coinModel);
    }).toList();

    final coinListController = StreamController<List<CoinListEntity>>();

    for (var coin in coins) {
      addSubscribe(coin.name);
    }

    channel.stream.listen((event) {
      var data = jsonDecode(event);

      if (data['type'] == 'ticker') {
        var updatedCoinInfo = CoinListInfoUpdModel.fromJson(data);

        var index = coinList
            .indexWhere((coin) => ('${coin.name}-USD') == data['product_id']);

        if (index != -1) {
          var oldCoin = coinList[index];
          coinList[index] = CoinListEntity(
            fullName: oldCoin.fullName,
            name: oldCoin.name,
            imageUrl: oldCoin.imageUrl,
            coinInfo: CoinListInfoEntity(
                price: double.parse(updatedCoinInfo.price),
                change: (double.parse(updatedCoinInfo.price) -
                        double.parse(updatedCoinInfo.change)) /
                    double.parse(updatedCoinInfo.change) *
                    100),
          );

          coinListController.add(coinList);
        }
      }
    });

    return coinListController.stream;
  }

  Stream<CoinDetailsEntity> convertStream(
      Stream<CoinDetailsModel> input) async* {
    await for (var model in input) {
      yield CoinDetailsEntity(
        price: model.price,
        dateTime: model.dateTime,
      );
    }
  }

  void connect() {
    if (!isWebSocketConnected) {
      channel = WebSocketChannel.connect(Uri.parse(ApiConfig.webSocketBase));
      isWebSocketConnected = true;
    }

  }

  void addSubscribe(String coinName) {
    final sub =
        '{"type": "subscribe", "product_ids": ["$coinName-USD"], "channels": ["ticker_batch"] }';
    if (!activeSubscriptions.contains(sub)) {
      channel.sink.add(sub);
      activeSubscriptions.add(sub);
    }
  }

  void deleteSubscribe(String coinName) {
    final sub =
        '{"type": "unsubscribe", "product_ids": ["$coinName-USD"], "channels": ["ticker_batch"] }';
    if (activeSubscriptions.contains(sub)) {
      channel.sink.add(sub);
      activeSubscriptions.add(sub);
    }
    print('$sub has been removed');
  }

  // static void close() {
  //   channel.sink.close();
  //   print('channel was closed');
  // }

  void close() {
    channel.sink.close();
    print('channel was closed');
  }
}
