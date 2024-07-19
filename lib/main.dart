import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umraheasier/routes.dart';

import 'bindings/intialbindings.dart';
import 'core/constant/color.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      theme: ThemeData(
        fontFamily: "Cairo",
        textTheme: const TextTheme(

            headline1: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColor.black),
            headline2: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: AppColor.black),
            bodyText1: TextStyle(
                height: 2,
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14)),
      ),
      initialBinding:initialBindings() ,

      getPages: routes,

    );
  }
}
