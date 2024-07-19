import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class SuccessResetPasswordController extends GetxController {

  goToPageLogin() ;

}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoute.login) ;
  }

}