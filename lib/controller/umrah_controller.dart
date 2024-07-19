import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:umraheasier/data/models/umrahdone_model.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/login.dart';
import '../data/datasource/remote/umrah/umrahusers_data.dart';


abstract class UmrahController extends GetxController {
  getUserUmrah();

}

class UmrahControllerImp extends UmrahController {
  LoginData loginData = LoginData(Get.find());
  UmrahUserData umrahUserData = UmrahUserData(Get.find());
  late String userid;
  String isstheumrah = '' ;

  String isihramfinish = '' ;
  String istawaffinish = '' ;
  String iswalkfinish = '' ;

  String umrahdoneIdsString = '';

  List umrahuserdone = [];




  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;




  @override
  getUserUmrah() async
  {
      statusRequest = StatusRequest.loading;
      update();
      var response = await umrahUserData.postdata(userid);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // Assuming response['data'] is a List of Map<String, dynamic>
          umrahuserdone.addAll(response['data'].map((e) => umrahdone_model.fromJson(e)).toList());
          print(umrahuserdone);

          isstheumrah = '0';
          int status1Count = 0;
          int status2Count = 0;

          for (var umrahDone in umrahuserdone) {
            umrahdoneIdsString='';
            if (umrahDone.umrahdoneStatus == '1') {
              status1Count++;
              isstheumrah = '1';
              umrahdoneIdsString += '${umrahDone.umrahdoneId}, ';
            }
            else if (umrahDone.umrahdoneStatus == '2') {
              isstheumrah = '0';
              status2Count++; // Increment the count for status 2
            }
          }

          umrahdoneIdsString = umrahdoneIdsString.isNotEmpty ? umrahdoneIdsString.substring(0, umrahdoneIdsString.length - 2) : '';

          myServices.sharedPreferences
              .setString("umrahdoneId", umrahdoneIdsString);


          print('Count of umrahdoneStatus = 1: $status1Count');
          print('Count of umrahdoneStatus = 2: $status2Count');



          int resultihram = await viewruknumrah(umrahdoneIdsString, '1');
          int resulttawaf = await viewruknumrah(umrahdoneIdsString, '2');
          int resultwalk = await viewruknumrah(umrahdoneIdsString, '3');


          if (resultihram == 1) {
            print('Displaying message: Result is 1');
            updaterukn( 'isihramfinish' ,  '1');
            isihramfinish = "1";
          } else {
            print('Displaying message: Result is not 1');
            updaterukn( 'isihramfinish' ,  '');
            isihramfinish = "";
          }


          if (resulttawaf == 1) {
            print('istawaffinish Displaying message: Result is 1');
            updaterukn( 'istawaffinish' ,  '1');
            istawaffinish = "1";
          } else {
            print('istawaffinishDisplaying message: Result is not 1');
            updaterukn( 'istawaffinish' ,  '');
            istawaffinish = "";
          }

          if (resultwalk == 1) {
            print('isiswalkfinishsh Displaying message: Result is 1');
            updaterukn( 'iswalkfinish' ,  '1');
            iswalkfinish = "1";
          } else {
            print('iiswalkfinishnishDisplaying message: Result is not 1');
            updaterukn( 'iswalkfinish' ,  '');
            iswalkfinish = "";
          }
          update();




        } else {
          //statusRequest = StatusRequest.failure;
          isstheumrah = '0';

        }
        print(' umrahdoneIdsString is: ($umrahdoneIdsString)');

      }
      update();

  }

  addNewUmrah() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await umrahUserData.addnewumrahdata(userid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

         isstheumrah = '1';
         isihramfinish = '' ;
         istawaffinish = '' ;
         iswalkfinish = '' ;
        update();




      } else {
        statusRequest = StatusRequest.failure;

      }

    }
    update();
  }

  finishruknumrah(String ruknid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await umrahUserData.finshtaskumrahdata(umrahdoneIdsString , ruknid ,userid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        getUserUmrah();
        update();


      } else {
        statusRequest = StatusRequest.failure;

      }

    }
    update();
  }


  Future<int> viewruknumrah(String umrahdoneIdsString, String ruknid) async {
    print('umrahdoneIdsString......................... $umrahdoneIdsString');
    print('ruknid......................... $ruknid');
    print('userid......................... $userid');

    statusRequest = StatusRequest.loading;
    update();

    var response = await umrahUserData.gettaskumrahdata(umrahdoneIdsString, ruknid, userid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        return 1;
      } else {
        return 0;
      }
    }
    return 0;
  }

  updaterukn(String nameofrukn , String number){
    myServices.sharedPreferences
        .setString(nameofrukn, number);

  }

  @override
  void onInit() {

    userid = myServices.sharedPreferences.getString("id")!;
    updatedata();
    getUserUmrah();

    if (myServices.sharedPreferences.getString("isihramfinish") == null) {
      isihramfinish = "";
    } else {
      isihramfinish = myServices.sharedPreferences.getString("isihramfinish")!;
    }

    if (myServices.sharedPreferences.getString("istawaffinish") == null) {
      istawaffinish = "";
    } else {
      istawaffinish = myServices.sharedPreferences.getString("istawaffinish")!;
    }

    if (myServices.sharedPreferences.getString("iswalkfinish") == null) {
      iswalkfinish = "";
    } else {
      iswalkfinish = myServices.sharedPreferences.getString("iswalkfinish")!;
    }

    print(' userid is: ($userid) .....................');
    print(' isihramfinish is: ($isihramfinish) .....................');

    print(' istawaffinish is: ($istawaffinish) .....................');
    print(' iswalkfinish is: ($iswalkfinish) .....................');

    print(' umrahdoneIdsString is: ($umrahdoneIdsString) .....................');
    print(' isstheumrah is: ($isstheumrah) .....................');


    super.onInit();
  }
  updatedata(){
    isstheumrah = '' ;
    isihramfinish = '' ;
    istawaffinish = '' ;
    iswalkfinish = '' ;
    umrahdoneIdsString = '';

    updaterukn( 'isstheumrah' ,  '');
    updaterukn( 'isihramfinish' ,  '');
    updaterukn( 'istawaffinish' ,  '');
    updaterukn( 'iswalkfinish' ,  '');
    update();

  }

  updateumrah() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await umrahUserData.updateumrahdata(umrahdoneIdsString);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        updatedata();
        onInit();

      } else {
        statusRequest = StatusRequest.failure;

      }

    }
    update();
  }

  @override
  void dispose() {

    super.dispose();
  }

}