
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/forgetpassword/resetpassword.dart';

abstract class ResetPasswordController extends GetxController{
  ResetPassword();
  goToSuccessResetPassword();

}
class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  ResetPasswordData  resetPasswordData = ResetPasswordData(Get.find());



  StatusRequest statusRequest = StatusRequest.none;

  late TextEditingController password;
  late TextEditingController repassword;


  bool isshopassword = true;

  String? email;


  showPassword(){
    isshopassword = isshopassword == true ? false : true;
    update();
  }



  @override
  ResetPassword() {



  }

  @override
  goToSuccessResetPassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "warning", middleText: "Password Not Match");
    }else{

      if (formstate.currentState!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await resetPasswordData.postdata(email! , password.text);
        print("=============================== Controller $response ");
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == "success") {
            Get.offNamed(AppRoute.successResetpassword);
          } else {
            Get.defaultDialog(title: "تنبيه", middleText: "حاول مره اخرى");
            statusRequest = StatusRequest.failure;
          }
        }
        update();

      } else {
        print("غير صحيح ");
      }
    }
  }


  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    email = Get.arguments['email'];

    super.onInit();

  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
