import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:umraheasier/core/constant/color.dart';

import '../../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double appBarHeight = MediaQuery.of(context).size.width > 600 ? 72.0 : 56.0;


    return Scaffold(
        body: Obx(() => controller.tabPages[controller.currentTabIndex.value]),
        bottomNavigationBar: ConvexAppBar(
          color: AppColor.primaryColor,
          backgroundColor: AppColor.bottombar,
          height:appBarHeight ,
          items: [
            TabItem(icon: Icons.home, title: 'الرئيسية'),
            TabItem(icon:  FontAwesome5.walking, title: 'ألأحرام'),
            TabItem(icon:  FontAwesome5.building, title: 'الطواف'),
            TabItem(icon: FontAwesome5.running, title: 'السعي'),
            TabItem(icon: Icons.logout, title: 'خروج'),
          ],
          onTap: (int i) { controller.changeTabIndex(i);},
        )
    );;
  }
}
