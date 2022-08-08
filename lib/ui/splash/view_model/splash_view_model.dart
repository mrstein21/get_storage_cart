import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

class SplashViewModel extends ChangeNotifier{
  SplashViewModel(BuildContext context){
    checkAuth(context);
  }
  checkAuth(BuildContext context)async{
     var box = await Hive.openBox('app_cart');
     var duration = const Duration(seconds: 2);
     return Timer(duration, () {
        if(box.containsKey("auth")){
          Navigator.pushNamedAndRemoveUntil(context,"/home", (route) => false);
        }else{
          Navigator.pushNamedAndRemoveUntil(context,"/register", (route) => false);
        }
     });
   }

}