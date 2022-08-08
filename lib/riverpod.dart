import 'package:cart_shoe/ui/list_shoe/view_model/list_shoe_view_model.dart';
import 'package:cart_shoe/ui/register/view_model/register_view_model.dart';
import 'package:cart_shoe/ui/splash/view_model/splash_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashViewModel = ChangeNotifierProvider.
family<SplashViewModel,BuildContext>((_,context) => SplashViewModel(context));

final registerViewModel = ChangeNotifierProvider((_) => RegisterViewModel());

final listShoeViewModel = ChangeNotifierProvider((_) => ListShoeViewModel());