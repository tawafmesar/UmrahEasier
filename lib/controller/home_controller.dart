import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:umraheasier/view/screen/tawaf.dart';
import 'package:umraheasier/view/screen/umrah.dart';

import '../core/constant/routes.dart';
import '../core/services/services.dart';
import '../view/screen/auth/logout.dart';
import '../view/screen/ihram.dart';
import '../view/screen/test.dart';
import '../view/screen/walk.dart';

class HomeController extends GetxController {
  var currentTabIndex = 0.obs;
  MyServices myServices = Get.find();

  final List<Widget> tabPages = [
    const UmrahScreen(),
    const IhramScreen(),
    const TawafScreen(),
    const WalkSceen(),
     LogoutScreen(),
  ];


  void changeTabIndex(int index) {
    currentTabIndex.value = index;
  }


  @override
  logout() async {

    myServices.sharedPreferences.setString("step","1") ;
    await Future.delayed(Duration.zero);
    Get.offNamed(AppRoute.login);
  }
}
