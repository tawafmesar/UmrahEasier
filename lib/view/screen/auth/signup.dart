import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signup_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/textsignup.dart';


class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('إنشاء حساب ',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignUpControllerImp>(
            builder:
                (controller) =>

                HandlingDataViewRequest(statusRequest: controller.statusRequest,
                    widget:
                    Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: controller.formstate,
                child: ListView(children: [
                  const SizedBox(height: 20),
                  const CustomTextTitleAuth(text: "اهلا بك"),
                  const SizedBox(height: 10),
                  const CustomTextBodyAuth(
                      text:
                      "يمكنك انشاء الحساب عبر البريد الألكتروني و بعض المعلومات عنك"),
                  const SizedBox(height: 15),

                  CustonTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 3, 20, "username");
                    },
                    mycontroller: controller.username,
                    hinttext: "ادخل اسم المستخدم",
                    iconData: Icons.person_outline,
                    labeltext: "اسم المستخدم",

                    // mycontroller: ,
                  ),

                  CustonTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 3, 35, "email");
                    },
                    mycontroller: controller.email,
                    hinttext: "ادخل البريد الالكتروني",
                    iconData: Icons.email_outlined,
                    labeltext: "البريد الألكتروني",
                    // mycontroller: ,
                  ),

                  CustonTextFormAuth(
                    isNumber: true,

                    valid: (val) {
                      return validInput(val!, 2, 19, "phone");
                    },
                    mycontroller: controller.phone,
                    hinttext: "ادخل رقم الجوال  ",
                    iconData: Icons.phone_android_outlined,
                    labeltext: "رقم الجوال",
                    // mycontroller: ,
                  ),
                  CustonTextFormAuth(
                    isNumber: false,

                    valid: (val) {
                      return validInput(val!, 3, 30, "password");
                    },
                    obscureText:true,

                    mycontroller: controller.password,
                    hinttext: "ادخل كلمة المرور",
                    iconData: Icons.lock_outline,
                    labeltext: " كلمة المرور",
                    // mycontroller: ,
                  ),

                  CustomButtomAuth(text: "انشاء", onPressed: () {
                    controller.signUp();
                  }),
                  const SizedBox(height: 40),
                  CustomTextSignUpOrSignIn(
                    textone: "هل لديك حساب مسبقاً ؟ ",
                    texttwo: " الذهاب لتسجيل الدخول ",
                    onTap: () {
                      controller.goToSignIn();
                    },
                  ),
                ]),
              ),
            )
        )),
      ),

    );
  }
}