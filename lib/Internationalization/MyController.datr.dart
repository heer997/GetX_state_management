import "package:flutter/material.dart";
import "package:get/get.dart";

class MyController2 extends GetxController {
  /// Here below, the Language code will store in "parameter1" and
  /// the Country code will store in "parameter2"
  void changeLanguage(var parameter1, var parameter2) {
    var locale = Locale(parameter1, parameter2);
    Get.updateLocale(locale);
  }
}
