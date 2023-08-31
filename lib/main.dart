import 'dart:convert';
import 'package:crypto_app/common/api_config.dart';
import 'package:crypto_app/presentation/pages/crypto_app.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:crypto_app/data/datasources/remote/websocket_handler.dart';

Future<void> main() async {
  runApp(const CryptoApp());



  // WebSocketHandler webSocketHandler = WebSocketHandler();
  //
  // webSocketHandler.connect();
  //
  // webSocketHandler.addSubscribe('BTC');
  //
  // await Future.delayed(const Duration(seconds: 30));
  //
  // WebSocketHandler.close();
}
