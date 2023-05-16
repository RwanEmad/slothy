import 'package:flutter/material.dart';
import 'package:slothy/modules/authentication/signUpScreen.dart';
import '../../layout/Home_layout.dart';
import '../../shared/components/component.dart';
import '../../shared/style/colors.dart';
import '../../shared/style/styles.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 25,
              ),
              Image.asset(
                "assets/images/studying.png",
              ),
              SizedBox(
                height: 40,
              ),
              defaultFormField(
                controller: emailController,
                type: TextInputType.text,
                lable: 'name@mail.com',
              ),
              SizedBox(
                height: 25,
              ),
              defaultFormField(
                controller: passwordController,
                type: TextInputType.text,
                lable: '********',
                ispassowrd: true,
              ),

              SizedBox(
                height: 40,
              ),
              defaultButton(
                  text: 'Login',
                  textColor: Colors.white,
                  buttonColor: green,
                  function: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Home_layout();
                    }));
                  },
                  width: 215,
                  height: 70),
              SizedBox(
                height: 10,
              ),
              textButton(text: "Forget Password?", function: () {}),
              //*****dont have forget Screen ui*****************
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New User?',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontStyle: italic,
                    ),
                  ),
                  textButton(
                      text: "Sign Up",
                      function: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return signUpScreen();
                        }));
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
