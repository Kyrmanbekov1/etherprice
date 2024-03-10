import 'package:binance/presentation/providers/provider.dart';
import 'package:binance/presentation/screens/trade_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EtheurProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: EtherTrade(),
      ),
    );
  }
}