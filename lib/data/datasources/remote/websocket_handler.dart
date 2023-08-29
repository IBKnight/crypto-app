import 'dart:convert';

import 'package:crypto_app/common/api_config.dart';
import 'package:crypto_app/data/models/coin_details/coin_details_model.dart';
import 'package:crypto_app/domain/entities/coin_details/coin_details_entity.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketHandler {
  static late WebSocketChannel channel;

  Stream<CoinDetailsModel> get detailsStream =>
      channel.stream.map<CoinDetailsModel>((value) {
        var data = jsonDecode(value);
        if (data['TYPE'] == '24') {
          return CoinDetailsModel.fromJson(data);
        }
        return CoinDetailsModel(price: 0, dateTime: 0);
      });

  Stream<CoinDetailsEntity> convertStream(
      Stream<CoinDetailsModel> input) async* {
    await for (var model in input) {
      if (model is CoinDetailsModel) {
        yield CoinDetailsEntity(
          price: model.price,
          dateTime: model.dateTime,
        );
      }
    }
  }

  Future<void> connect() async {
    final apiKey =
        '7fdf206d6413d7386112e78ba6da5a67fd6c06bc10d22f1b137b5951758a2ea8';

    channel = WebSocketChannel.connect(
        Uri.parse('${ApiConfig.webSocketBase}?api_key=$apiKey'));

    //channel.sink.add('{"action": "SubAdd", "subs": ["24~CCCAGG~BTC~USD~m"]}');

    //
    // channel.stream.listen((event) {
    //   var data = jsonDecode(event);
    //   print(data.toString());
    // }, onError: (error) {
    //   print('Error: $error');
    // });
  }

  void addSubscribe(String sub) {
    channel.sink.add('{"action": "SubAdd", "subs": ["$sub"]}');
  }

  void deleteSubscribe() {}

  static void close() {
    channel.sink.close();
    print('channel was closed');
  }
}
