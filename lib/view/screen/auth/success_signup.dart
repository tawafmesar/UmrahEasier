import 'package:flutter/material.dart';
import '../../../controller/auth/successsignup_controller.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../widget/auth/custombuttonauth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller = Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('نجاح',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              )),
          Text("تهانينا",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 30)),
          Text("تم إنشاء الحساب بنجاح"),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButtomAuth(
                text: "الذهاب لتسجيل الدخول",
                onPressed: () {
                   controller.goToPageLogin();
                }),
          ),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}