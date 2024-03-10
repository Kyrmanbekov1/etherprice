import 'dart:convert';

import 'package:binance/presentation/providers/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class EtherTrade extends StatefulWidget {
  const EtherTrade({super.key});

  @override
  State<EtherTrade> createState() => _EtherTradeState();
}

class _EtherTradeState extends State<EtherTrade> {
  late final WebSocketChannel channel;
  List<FlSpot> price = [];
  

  @override
  void initState() {
    super.initState();
    channel = WebSocketChannel.connect(
      Uri.parse('wss://stream.binance.com:9443/ws/etheur@trade'),
    );
    
  }
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 43, 40, 40),
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            
          }, icon: Image.asset('assets/pngs/ether.png'))
,
          backgroundColor: const Color.fromARGB(255, 43, 40, 40),
          title: Text('Ether/Usd',
          style: TextStyle(
            color: Colors.white
          ),
          ),
        ),
        body: Column(
          children: [
            StreamBuilder<dynamic>(
                stream: channel.stream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    print(snapshot.data);
                    final Map<String, dynamic> data =
                        json.decode(snapshot.data);
                        index++;
                    price.add(FlSpot(index.toDouble(),
                        double.tryParse(data['p'] ?? "") ?? 0));
                    return Column(
                      children: [
                        Text(data["p"],
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white
                        ),),
                        SizedBox(
                          height: 20,
                        ),
                        Container(                         
                          color: const Color.fromARGB(255, 19, 57, 75),
                          width: 350,
                          height: 380,
                          child: LineChart(LineChartData(
                              minX: 0,
                              maxX: price.length.toDouble(),
                              minY: 2550,
                              maxY: 4500,
                              gridData: FlGridData(
                                show: true,
                                getDrawingHorizontalLine: (value){
                                  return FlLine(
                                    color: const Color.fromARGB(255, 16, 61, 97),
                                    strokeWidth: 1,
                                  );
                                },
                                drawVerticalLine: true,
                                getDrawingVerticalLine: (value){
                                  return FlLine(
                                    color: Color.fromARGB(255, 18, 109, 21),
                                    strokeWidth: 1,
                                    
                                  );
                                },

                              ),
                              borderData: FlBorderData(
                                show: true,
                                border: Border.all(
                                  color: Color.fromARGB(255, 18, 109, 21),
                                )
                              ),
                              lineBarsData: [LineChartBarData(spots: price,
                              isCurved: false,
                              color: Colors.green,
                              barWidth: 5,
                              belowBarData: BarAreaData(
                                show: false
                              ),
                              ),],),),
                        ),
                        
                      ],
                      
                    );
                  }
                  return Column(
                    children: [
                      Image.asset('assets/pngs/gif1.gif',
                      width: double.maxFinite,
                     
                      ),
                      Text('Welcome',
                      style: TextStyle(
                        height: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      ),
                        SizedBox(
                          height: 20,
                        )
                    ],
                    
                  );
                }),
                SizedBox(
                  height: 30,
                ),
            Center(
              
            ),
          ],
        ));
  }
}
