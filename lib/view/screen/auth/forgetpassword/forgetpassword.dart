import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/forgetpassword/forgetpassword_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());

    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColor.backgroundcolor,
            elevation: 0.0,
            centerTitle: true,
            title: Text("هل نسيت كلمة المرور",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: AppColor.grey))),
        body: GetBuilder<ForgetPasswordControllerImp>(
            builder: (controller) =>

                HandlingDataViewRequest(statusRequest: controller.statusRequest,
                  widget:

                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          CustomTextTitleAuth(text: "فحص البريد الالكتروني"),
                          const SizedBox(height: 10,),
                          CustomTextBodyAuth(
                              text: "الرجاء ادخال البريد لتلقي رمز التحقق"
                            //"Please enter your email address to receive a verification code "
                          ),
                          const SizedBox(height: 15,),

                          CustonTextFormAuth(


                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 5, 100, "email");
                            },
                            mycontroller: controller.email,
                            hinttext: "ادخل بريدك الألكتروني",
                            iconData: Icons.email_outlined,
                            labeltext: "البريد الألكتروني",
                          ),

                          CustomButtomAuth(
                            text: "فحص",
                            onPressed: () {
                              controller.checkemail();
                            },
                          ),
                          const SizedBox(height: 30,),

                        ],
                      ),
                    ),
                  )
                  ,

                )
        )

    );
  }
}