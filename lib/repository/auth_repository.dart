import 'package:get_storage/get_storage.dart';

class AuthRepository{
  GetStorage storage=new GetStorage();

  void saveSession(Map<String,dynamic>user){
    storage.write("auth",user);
  }

  void deleteSession(){
    storage.remove("auth");
    storage.remove("cart");
    ///in case if you want to delete all kind of key
    //storage.erase();
  }

  Map<String,dynamic>getUserSession(){
    Map<String,dynamic> raw_data=storage.read("auth");
    return raw_data;
  }

}