import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  postdata(String email) async {
    var response = await crud.postData(AppLink.checkEmail, {
      "email" : email
    });
    return response.fold((l) => l, (r) => r);
  }
}