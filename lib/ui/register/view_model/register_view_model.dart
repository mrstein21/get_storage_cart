import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

class RegisterViewModel extends ChangeNotifier{
  GlobalKey<FormState> formKey= new GlobalKey<FormState>();

  String _email="";
  String _name="";
  String _password="";

  set email(String value) {
    _email = value;
  }

  set name(String value) {
    _name = value;
  }

  set password(String value) {
    _password = value;
  }

  var _isObscured = true;

  bool get isObscured => _isObscured;

  void obscureEvent(){
    if(_isObscured==true){
     _isObscured=false;
     notifyListeners();
    }else{
      _isObscured=true;
      notifyListeners();
    }
  }

  void register(BuildContext context)async{
    var box = await Hive.openBox('app_cart');
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      Map<String,dynamic>data={
        "name":_name,
        "email":_email,
      };
      box.put("auth", data);
      Navigator.pushNamedAndRemoveUntil(context,"/home", (route) => false);
    }
  }


}