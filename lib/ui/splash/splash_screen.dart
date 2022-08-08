import 'package:cart_shoe/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    ref.read(splashViewModel(context));
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
