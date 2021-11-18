import 'package:cart_shoe/ui/cart/cart_binding.dart';
import 'package:cart_shoe/ui/cart/cart_screen.dart';
import 'package:cart_shoe/ui/list_shoe/list_shoe_binding.dart';
import 'package:cart_shoe/ui/list_shoe/list_shoe_screen.dart';
import 'package:cart_shoe/ui/register/register_binding.dart';
import 'package:cart_shoe/ui/register/register_screen.dart';
import 'package:cart_shoe/ui/splash/splash_binding.dart';
import 'package:cart_shoe/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.black,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: "/", page: ()=>ListShoeScreen(),binding: ListShoeBinding()),
        GetPage(name: "/cart", page: ()=>CartScreen(),binding: CartBinding()),
        GetPage(name: "/splash", page: ()=>SplashScreen(),binding: SplashBinding()),
        GetPage(name: "/register", page: ()=>RegisterScreen(),binding: RegisterBinding())

      ],
      initialRoute: "/splash",
    );
  }
}


