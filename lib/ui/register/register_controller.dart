import 'package:cart_shoe/repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
  String email="";
  String name="";
  String password="";
  var isObscured=true.obs;
  void obscureEvent(){
    if(isObscured.value==true){
      isObscured(false);
    }else{
      isObscured(true);
    }
  }


  void register(GlobalKey<FormState>formkey){
    if(formkey.currentState.validate()){
      formkey.currentState.save();
      Map<String,dynamic>data={
        "name":name,
        "email":email,
        "password":password
      };
      AuthRepository().saveSession(data);
      Get.offAllNamed("/");
    }
  }
}