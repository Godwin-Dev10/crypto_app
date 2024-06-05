// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:crypto_app/models/coin_data.dart';
import 'package:crypto_app/services/register_services.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final CoinData coin;

  const DetailsScreen({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          coin.name!,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.02),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.10,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Image.network(getCryptoImageUrl(coin.name!)),
                    ),
                    Text.rich(
                      TextSpan(
                          children: [
                            TextSpan(
                              text: "\$ ${coin?.values?.uSD?.price?.toStringAsFixed(2)}\n",
                              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: "\$ ${coin?.values?.uSD?.percentChange24h?.toStringAsFixed(2)} %",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: coin!.values!.uSD!.percentChange24h! > 0
                                    ? Colors.green
                                    : Colors.red
                              ),
                            ),
                          ]
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                  ),
                  children: [
                    infoCard("Circulating Supply", coin.circulatingSupply.toString()),
                    infoCard("Maximum Supply", coin.maxSupply.toString()),
                    infoCard("Total Supply", coin.totalSupply.toString()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget infoCard(String title, String subtitle) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10
      ),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
          Text(subtitle, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
        ],
      ),
    );
  }
}
