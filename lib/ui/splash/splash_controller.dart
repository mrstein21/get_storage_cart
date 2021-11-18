import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController{
 GetStorage storage=GetStorage();

 startSplash(){
   var duration = const Duration(seconds: 2);
   return Timer(duration, () {
     if (storage.hasData("auth")) {
       Get.offNamed("/");
     } else {
       Get.offNamed("/register");
     }
   });
 }

}