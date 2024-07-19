import 'package:flutter/material.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/LogoAuth.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import 'package:get/get.dart';

import '../../widget/auth/textsignup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('تسجيل الدخول',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
            builder: (controller)  =>

                HandlingDataViewRequest(statusRequest: controller.statusRequest
                    , widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: controller.formstate,
                child: ListView(children: [
                  const LogoAuth(),
                  const SizedBox(height: 20),
                  const CustomTextTitleAuth(text: "اهلا بك "),
                  const SizedBox(height: 10),
                  const CustomTextBodyAuth(
                      text:
                      "قم بتسجيل الدخول عبر البريد الألكتروني وكلمة المرور الخاصة بك"),
                  const SizedBox(height: 15),

                  CustonTextFormAuth(
                    isNumber: false ,
                    valid: (val) {
                      return validInput(val!, 5, 100, "email");
                    },
                    mycontroller: controller.email,
                    hinttext: "ادخل بريدك الألكتروني",
                    iconData: Icons.email_outlined,
                    labeltext: "البريد الألكتروني",
                  ),
                  CustonTextFormAuth(
                    isNumber: false ,
                    valid: (val) {
                      return validInput(val!, 5, 30, "password");
                    },
                    obscureText:true,
                     mycontroller: controller.password,
                    hinttext: "ادخل كلمة المرور",
                    iconData: Icons.lock_outline,
                    labeltext: "كلمة المرور",
                  ),
                  InkWell(
                    onTap: () {
                      controller.goToForgetPassword();
                    },
                    child:  const Text(
                      "هل نسيت كلمة المرور",
                      textAlign: TextAlign.right,
                    ),
                  ),
                  CustomButtomAuth(text: "تسجيل الدخول", onPressed: () {
                    controller.login();
                  }),
                  const SizedBox(height: 40),
                  CustomTextSignUpOrSignIn(
                    textone: "ليس لديك حساب ؟ ",
                    texttwo: "انشاء حساب",
                    onTap: () {
                      controller.goToSignUp();
                    },
                  )
                ]),
              ),
            )
        ))
        ,
      ),
    );
  }
}

