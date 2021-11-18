import 'package:cart_shoe/ui/splash/splash_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashController controller=Get.find<SplashController>();
  @override
  Widget build(BuildContext context) {
    controller.startSplash();
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("SteinSneaker",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,fontFamily: 'Poppins',color: Colors.white),),
              SizedBox(height: 5,),
              Text("A shop that provide many kind of shoes",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14,fontFamily: 'Poppins'),)
            ]
          ),
        ),
      ),
    );
  }
}
