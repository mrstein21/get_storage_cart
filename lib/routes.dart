import 'package:cart_shoe/ui/list_shoe/list_shoe_screen.dart';
import 'package:cart_shoe/ui/register/register_screen.dart';
import 'package:cart_shoe/ui/splash/splash_screen.dart';

const String homeRoute="/home";
const String splashRoute="/splash";
const String registerRoute="/register";


final routesPage={
  homeRoute:(context)=>ListShoeScreen(),
  splashRoute:(context)=>SplashScreen(),
  registerRoute:(context)=>RegisterScreen()
};