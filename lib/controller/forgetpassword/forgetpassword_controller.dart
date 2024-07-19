
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/forgetpassword/checkemail.dart';

abstract class ForgetPasswordController extends GetxController{
  checkemail();

}
class ForgetPasswordControllerImp extends ForgetPasswordController {

  CheckEmailData checkEmailData = CheckEmailData(Get.find());


  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;

  late TextEditingController email;

  @override
  checkemail() async {
    if (formstate.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postdata(email.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.verfiyCode,
              arguments: {
                "email" : email.text
              }
          );
        } else {
          Get.defaultDialog(title: "Warning", middleText: "Email not found");
          statusRequest = StatusRequest.failure;
        }
      }
      update();

    }

  }



  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();

  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}