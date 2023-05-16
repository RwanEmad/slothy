import 'dart:math';

import 'package:flutter/material.dart';
import 'package:slothy/modules/homeScreen.dart';
import '../../shared/components/component.dart';
import '../../shared/style/colors.dart';
import '../../shared/style/styles.dart';
import 'loginScreen.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({Key? key}) : super(key: key);

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {



  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 25,),
              Image.asset("assets/images/alarm-clock.png",),
              SizedBox(height: 40,),
              defaultFormField(controller:usernameController , type: TextInputType.text, lable: 'Username'),
              SizedBox(height: 25,),
              defaultFormField(controller:emailController , type: TextInputType.text, lable: 'name@mail.com'),
              SizedBox(height: 25,),
              defaultFormField(controller:passwordController , type: TextInputType.text, lable: '********',ispassowrd: true),
              SizedBox(height: 40,),
              defaultButton(text: 'Sign Up', textColor: Colors.white, buttonColor:lavander, function: (){Navigator.push(
                  context, MaterialPageRoute(builder: (BuildContext context) {
                return homeScreen();
              }));}, width: 215,height:70),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?',style: TextStyle(fontSize: 18,color:Colors.black,fontWeight: FontWeight.w500, fontStyle:italic,),),
                  textButton(text: "Login", function: (){ Navigator.push(
                      context, MaterialPageRoute(builder: (BuildContext context) {
                    return loginScreen();
                  }));}),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
