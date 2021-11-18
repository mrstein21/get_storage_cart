import 'package:cart_shoe/ui/register/register_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  GlobalKey<FormState>formKey= new GlobalKey<FormState>();
  RegisterController registerController=Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Container(
          padding: EdgeInsets.all(30),
          child: ListView(
            children: [
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child:Text("SteinSneaker",textAlign:TextAlign.center,style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                            fontSize: 40))
                    ),
                    SizedBox(height:50),
                    TextFormField(
                      validator: (String value){
                        if(value.isEmpty){
                          return "please fill your name";
                        }
                        return null;
                      },
                      onSaved: (String value){
                        registerController.name=value;
                      },
                      style:  new TextStyle(
                        fontFamily: "Poppins",
                      ),
                      decoration: InputDecoration(
                          labelText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(),
                          )
                      ),
                    ),
                    SizedBox(height:30),
                    TextFormField(
                      validator: (String value){
                        if(value.isEmpty){
                          return "please fill your email";
                        }
                        return null;
                      },
                      onSaved: (String value){
                        registerController.email=value;
                      },
                      style:  new TextStyle(
                        fontFamily: "Poppins",
                      ),
                      decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(),
                          )
                      ),
                    ),
                    SizedBox(height:30),
                    Obx(
                          ()=> TextFormField(
                        obscureText: registerController.isObscured.value,
                        validator: (String value){
                          if(value.isEmpty){
                            return "please fill your password";
                          }
                          return null;
                        },
                        onSaved: (String value){
                          registerController.password=value;
                        },
                        style:  new TextStyle(
                          fontFamily: "Poppins",
                        ),
                        decoration: InputDecoration(
                            labelText: "Password",
                            suffixIcon:
                            InkWell(
                              onTap: (){
                                registerController.obscureEvent();
                              },
                              child: registerController.isObscured==true?
                              Icon(Icons.visibility):Icon(Icons.visibility_off),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: new BorderSide(),
                            )
                        ),
                      ),
                    ),
                    SizedBox(height:30),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton(
                        color: Colors.black,
                        onPressed: (){
                          //eksekusi fungsi register
                          registerController.register(formKey);
                        },
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                        elevation: 4.0,
                        child: Text("Register",style:TextStyle( color: Colors.white,fontSize: 15.0,)),
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ) ,
    );
  }
}
