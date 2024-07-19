import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class UmrahUserData {
  Crud crud;
  UmrahUserData(this.crud);
  postdata(String usersid) async {
    var response = await crud.postData(AppLink.viewumrah,
        {"usersid" : usersid
    });
    return response.fold((l) => l, (r) => r);
  }


  addnewumrahdata(String usersid) async {
    var response = await crud.postData(AppLink.addnewumrah,
        {"usersid" : usersid
        });
    return response.fold((l) => l, (r) => r);
  }

  updateumrahdata(String id) async {
    var response = await crud.postData(AppLink.updateumrah,
        {"id" : id
        });
    return response.fold((l) => l, (r) => r);
  }



  finshtaskumrahdata(String numberOfumrah , String umrah_rukn_id , String usersid) async {
    var response = await crud.postData(AppLink.addfinishtask,
        {"numberOfumrah" : numberOfumrah,
          "umrah_rukn_id" : umrah_rukn_id,
          "usersid" : usersid
        });
    return response.fold((l) => l, (r) => r);
  }
  gettaskumrahdata(String numberOfumrah , String umrah_rukn_id , String user_id) async {
    var response = await crud.postData(AppLink.viewtaskumrah,
        {"numberOfumrah" : numberOfumrah,
          "umrah_rukn_id" : umrah_rukn_id,
          "user_id" : user_id
        });
    return response.fold((l) => l, (r) => r);
  }

}