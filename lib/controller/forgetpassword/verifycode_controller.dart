import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/forgetpassword/verifycode.dart';

abstract class VerifyCodeController extends GetxController{
  checkCode();
  goToRestPassword(String verifycode);

}
class VerifyCodeControllerImp extends VerifyCodeController {


  String? email;

  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData= VerifyCodeForgetPasswordData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode() {

  }



  @override
  goToRestPassword(verifycode) async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeForgetPasswordData.postdata(email!, verifycode);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.resetPassword,
            arguments: {
              "email" : email

            }
        );
      } else {
        Get.defaultDialog(
            title: "تنبيه",
            middleText: "رمز التحقق الذي ادخلتة غير صحيح");
        statusRequest = StatusRequest.failure;
      }
    }
  }




  @override
  void onInit() {
    email = Get.arguments['email'];

    super.onInit();

  }

  @override
  void dispose() {

    super.dispose();
  }

}