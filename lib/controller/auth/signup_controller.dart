import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/auth/signup.dart';
import 'dart:math';
abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}


class SignUpControllerImp extends SignUpController {
GlobalKey<FormState> formstate = GlobalKey<FormState>();

late TextEditingController username;
late TextEditingController email;
late TextEditingController phone;
late TextEditingController password;

StatusRequest statusRequest = StatusRequest.none;
int verifyCode = 10000 + Random().nextInt(90000);
String verifyCodeString ='';

SignupData signupData = SignupData(Get.find());

List data = [];


@override
signUp() async {
  if (formstate.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update() ;
    var response = await signupData.postdata(
        username.text, password.text, email.text, phone.text , verifyCodeString);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        var response2 = await signupData.postemaildata(
            username.text, password.text, email.text, phone.text, verifyCodeString);
        print("=============================== Controller $response2 ");

        Get.offNamed(AppRoute.verfiyCodeSignUp  ,arguments: {
          "email" : email.text
        });
      } else {
        Get.defaultDialog(title: "تنبيــة" , middleText: "يرجى التأكد , البريد الألكتروني او رقم الهاتف موجود مسبقاً") ;
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  } else {

  }
}


  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController() ;
    phone = TextEditingController() ;
    email = TextEditingController();
    password = TextEditingController();
    verifyCodeString = verifyCode.toString();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}