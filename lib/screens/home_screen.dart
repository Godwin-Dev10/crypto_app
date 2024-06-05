// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:crypto_app/controllers/assets_controller.dart';
import 'package:crypto_app/customWidgets/custom_appBar.dart';
import 'package:crypto_app/models/tracked_asset.dart';
import 'package:crypto_app/screens/details_screen.dart';
import 'package:crypto_app/services/register_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  AssetsController assetsController = Get.find();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "\$",
                        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: assetsController.getPortfolioValue().toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]
                  ),
                ),
              ),
            ),
            Center(child: Text("Portfolio Value"),),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.sizeOf(context).height * 0.04,
                horizontal: MediaQuery.sizeOf(context).width * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    child: Text("Portfolio",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black38,
                        fontWeight: FontWeight.w500,
                      ),),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.65,
                    width: MediaQuery.sizeOf(context).width,
                    child: ListView.builder(
                      itemCount: assetsController.trackedAssets.length,
                      itemBuilder: (context, index) {
                        TrackedAsset trackedAsset = assetsController.trackedAssets[index];
                        return ListTile(
                          leading: Image.network(getCryptoImageUrl(trackedAsset.name!)),
                          title: Text(trackedAsset.name!),
                          subtitle: Text("USD: ${assetsController.getAssetPrice(trackedAsset.name!).toStringAsFixed(2)}"),
                          trailing: Text(trackedAsset.amount.toString(),
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),),
                          onTap: () {
                            Get.to(() {
                              return DetailsScreen(
                                  coin: assetsController.getCoinData(trackedAsset.name!)!,
                              );
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ))
      ),
    );
  }
}


