

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(String username ,String password ,String email ,String phone ,String verifyCode) async {
    var response = await crud.postData(AppLink.signUp, {
      "username" : username ,
      "password" : password  ,
      "email" : email ,
      "phone" : phone  ,
      "verifyCode" : verifyCode  ,
    });
    return response.fold((l) => l, (r) => r);
  }

  postemaildata(String username ,String password ,String email ,String phone ,String verifyCode) async {
    var response = await crud.postData('https://medicinetime99.000webhostapp.com/umrahsendemail/auth/signup.php', {
      "username" : username ,
      "password" : password  ,
      "email" : email ,
      "phone" : phone  ,
      "verifyCode" : verifyCode  ,
    });
    return response.fold((l) => l, (r) => r);
  }
}