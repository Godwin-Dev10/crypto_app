// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:crypto_app/screens/home_screen.dart';
import 'package:crypto_app/services/register_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  await registerServices();
  await registerControllers();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green),
      ),
      home: Container(),
      routes: {
        "/home": (context) => HomeScreen(),
      },
      initialRoute: "/home",
    );
  }
}
