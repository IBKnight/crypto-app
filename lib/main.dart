import 'dart:convert';

import 'package:crypto_app/presentation/pages/crypto_app.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

void main() async {

  runApp(const CryptoApp());

  // final channel = IOWebSocketChannel.connect(Uri.parse(
  //     'wss://streamer.cryptocompare.com/v2?api_key=32dc6a1c7548897db4ce8bcc532500c0e0bb678ce4d60fcbaba7ff99d6f795ef'));
  //
  // // Отправляем сообщение для подписки на определенные торговые пары
  // final subscriptionMessage = json.encode({
  //   "action": "SubAdd",
  //   "subs": ["2~Coinbase~BTC~USD"]
  // });
  //
  // channel.sink.add(subscriptionMessage);
  //
  // channel.stream.listen(
  //   (message) {
  //     Map<String, dynamic> data = json.decode(message);
  //     // print(data.toString());
  //
  //     if(data.containsKey("PRICE")){
  //       double? btcPrice = data["PRICE"];
  //       print('BTC Price: ${btcPrice?.toStringAsFixed(2)} USD');
  //     }
  //
  //     // print(data['']);
  //     //
  //     // Map<String, dynamic> coinData = data['MESSAGE'];
  //     // dynamic btcPrice = coinData['PRICE'];
  //     // print('BTC Price: $btcPrice');
  //   },
  // );
  //
  // // Продолжаем слушать в течение некоторого времени (например, 30 секунд)
  // await Future.delayed(Duration(seconds: 60));
  // channel.sink.close();

}



