import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  void changeLanguage() {
    var code = Get.locale!.languageCode;

    if(code == 'kh') {
      var local = Locale('en', 'US');
      Get.updateLocale(local);
    } else {
      var local = Locale('kh', 'KH');
      Get.updateLocale(local);
    }
    print('language code ${code}');
  }
}