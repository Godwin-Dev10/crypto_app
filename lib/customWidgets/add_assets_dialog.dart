// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:crypto_app/controllers/add_assets_dialog_controlller.dart';
import 'package:crypto_app/controllers/assets_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAssetsDialog extends StatelessWidget {
  final controller = Get.put(AddAssetsDialogController());
  final assetsController = Get.put(AssetsController());

  AddAssetsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Center(
          child: Material(
            child: Container(
                height: MediaQuery.sizeOf(context).height * 0.40,
                width: MediaQuery.sizeOf(context).width * 0.80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: controller.loading.isTrue
                    ? Center(
                        child: SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator()))
                    : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DropdownButton(
                              value: controller.selectedAsset.value,
                              items: controller.assets.map((asset) {
                                return DropdownMenuItem(
                                  value: asset,
                                  child: Text(asset),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  controller.selectedAsset.value = value;
                                }
                              },
                            ),

                            TextField(
                              onChanged: (value) {
                                controller.assetValue.value = double.parse(value);
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder()
                              ),
                            ),

                            MaterialButton(
                              onPressed: () {
                                assetsController.addTrackAsset(
                                  controller.selectedAsset.value,
                                  controller.assetValue.value,
                                );
                                Get.back();
                              },
                              color: Theme.of(context).colorScheme.primary,
                              child: Text("Add Asset",
                                style: TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
                    )),
          ),
        ));
  }
}
