import 'dart:convert';
import 'dart:io';
import 'package:crypto_app/data/datasources/remote/websocket_handler.dart';
import 'package:crypto_app/presentation/pages/crypto_app.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

Future<void> main() async {


  // WebSocketHandler().close();

 runApp(const CryptoApp());



  //channel.sink.add('{"action": "SubAdd", "subs": ["2~Coinbase~BTC~USD"]}');
  // channel.sink.add('{"action": "SubAdd", "subs": []}');
  // channel.sink.add('{"action": "SubRemove", "subs": ["5~CCCAGG~BTC~USD"]}');
  //channel.sink.add('{"action": "SubRemove", "subs": ["*"]}');
  //
  // channel.sink.add('{"action": "SubAdd", "subs": ["2~Coinbase~BTC~USD"]}');

  // channel.sink.add('{"action": "SubRemove", "subs": ["24~CCCAGG~BTC~USD~D"]}');

  // Слушаем события с WebSocket


  // final channel = WebSocketHandler();
  // channel.connect();
  // channel.addSubscribe('24~CCCAGG~BTC~USD~m');
  // // channel.addSubscribe('2~Coinbase~BTC~USD');
  //
  //
  // await Future.delayed(const Duration(seconds: 30));
  //
  // WebSocketHandler.close();

}
