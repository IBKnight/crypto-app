import 'dart:convert';

import 'package:crypto_app/common/api_config.dart';
import 'package:crypto_app/data/models/coin_details/coin_details_model.dart';
import 'package:crypto_app/domain/entities/coin_details/coin_details_entity.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketHandler {
  static late WebSocketChannel channel;
  Set<String> activeSubscriptions = {};
  bool isWebSocketConnected = false;

  Stream<CoinDetailsModel> get detailsStream =>
      channel.stream.asyncMap<CoinDetailsModel>((value) {
        var data = jsonDecode(value);
        if (data['type'] == 'ticker') {
          return CoinDetailsModel.fromJson(data);
        }
        return CoinDetailsModel(price: '0', dateTime: DateTime.fromMicrosecondsSinceEpoch(0));
      });

  //
  // Stream<CoinDetailsModel> get getCoinsListStream =>
  //     channel.stream.map<CoinDetailsModel>((value) {
  //       var data = jsonDecode(value);
  //       if (data['TYPE'] == '2') {
  //         return CoinDetailsModel.fromJson(data);
  //       }
  //       return CoinDetailsModel(price: 0, dateTime: 0);
  //     });

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
      channel =
          WebSocketChannel.connect(Uri.parse(ApiConfig.webSocketBase));
      isWebSocketConnected = true;
    }

    // channel.stream.listen((event) {
    //   var data = jsonDecode(event);
    //   print(data.toString());
    // }, onError: (error) {
    //   print('Error: $error');
    // });
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
        '{"type": "subscribe", "product_ids": ["$coinName-USD"], "channels": ["ticker_batch"] }';
    if (activeSubscriptions.contains(sub)) {
      channel.sink.add(sub);
      activeSubscriptions.add(sub);
    }
    print('$sub has been removed');
  }

  static void close() {
    channel.sink.close();
    print('channel was closed');
  }
}
