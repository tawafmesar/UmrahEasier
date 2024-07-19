import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "اسم المستخدم غير صحيح";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "البريد الألكتروني غير صحيح";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "رقم الهاتف غير صحيح";
    }
  }

  if (val.isEmpty) {
    return "لايمكن ان يكون فارغ";
  }

  if (val.length < min) {
    return " يجب ان لا يكون اقل من $min";
  }

  if (val.length > max) {
    return " يجب ان لايكون اكبر من $max";
  }
}