import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../core/constant/imageasset.dart';
import '../../core/constant/routes.dart';
import '../../core/localization/changelocal.dart';

class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay for 2 seconds and then change language and navigate
    Future.delayed(const Duration(seconds: 2), () {
      Get.find<LocaleController>().changeLang("ar");
      Get.offNamed(AppRoute.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to black
      body: Center(
        child: Image.asset(
          AppImageAsset.logo
          ,
        ),
      ),
    );
  }
}

