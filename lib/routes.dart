import 'package:umraheasier/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:umraheasier/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:umraheasier/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:umraheasier/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:umraheasier/view/screen/auth/login.dart';
import 'package:umraheasier/view/screen/auth/signup.dart';
import 'package:umraheasier/view/screen/auth/success_signup.dart';
import 'package:umraheasier/view/screen/auth/verifycodesignup.dart';
import 'package:umraheasier/view/screen/counter.dart';
import 'package:umraheasier/view/screen/home.dart';
import 'package:umraheasier/view/screen/umrah.dart';

import 'view/screen/language.dart';

import 'core/constant/routes.dart';

import 'package:get/get.dart';

import 'core/middleware/mymiddleware.dart';


List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Language() , middlewares: [
    MyMiddleWare()
  ]),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successResetpassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),

GetPage(name: AppRoute.homepage , page: () =>  HomeScreen()),

  GetPage(name: AppRoute.umrah , page: () =>  UmrahScreen()),
  GetPage(name: AppRoute.counterScreen , page: () =>  CounterScreen()),





];