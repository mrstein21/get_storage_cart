import 'package:cart_shoe/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final _viewModel=ref.watch(registerViewModel);
    return Scaffold(
      body:Center(
        child: Container(
          padding: EdgeInsets.all(30),
          child: ListView(
            children: [
              Form(
                key: _viewModel.formKey,
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
                      validator: (String? value){
                        if(value!.isEmpty){
                          return "please fill your name";
                        }
                        return null;
                      },
                      onSaved: (String? value){
                        _viewModel.name=value!;
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
                      validator: (String? value){
                        if(value!.isEmpty){
                          return "please fill your email";
                        }
                        return null;
                      },
                      onSaved: (String? value){
                        _viewModel.email=value!;
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
                    TextFormField(
                        obscureText: _viewModel.isObscured,
                        validator: (String? value){
                          if(value!.isEmpty){
                            return "please fill your password";
                          }
                          return null;
                        },
                        onSaved: (String? value){
                          _viewModel.password=value!;
                        },
                        style:  new TextStyle(
                          fontFamily: "Poppins",
                        ),
                        decoration: InputDecoration(
                            labelText: "Password",
                            suffixIcon:
                            InkWell(
                              onTap: (){
                                _viewModel.obscureEvent();
                              },
                              child: _viewModel.isObscured==true?
                              Icon(Icons.visibility):Icon(Icons.visibility_off),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: new BorderSide(),
                            )
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
                          _viewModel.register(context);
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
