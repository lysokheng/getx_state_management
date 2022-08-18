import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/screen/counter_getx_screen.dart';
import 'package:getx_state_management/screen/counter_screen.dart';
import 'package:getx_state_management/screen/dashboard_screen.dart';
import 'package:getx_state_management/screen/home_screen.dart';
import 'package:getx_state_management/utils/translation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Messages(), // your translations
      locale: Locale('en', 'US'), // translations will be displayed in that locale
      home: DashBoardScreen(),
    );
  }
}


