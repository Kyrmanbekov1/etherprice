import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class EtheurProvider extends ChangeNotifier {
  Map? data;

  EtheurProvider (){
    getEther();
  }

  final channel = WebSocketChannel.connect(
    Uri.parse('wss://stream.binance.com:9443/ws/etheur@trade'),
  );

  void getEther() {
    channel.stream.listen((message) {
      data = jsonDecode(message);
      print(data);
     
    });
     notifyListeners();
  }
}