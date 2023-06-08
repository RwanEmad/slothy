import 'dart:ui';

import 'package:flutter/material.dart';
import '../shared/components/component.dart';
import '../shared/style/colors.dart';
import 'authentication/loginScreen.dart';
import 'authentication/signUpScreen.dart';

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.cyan,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "Welcome to",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Slothy",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Image.asset("assets/logo/img.png",
                              width: 110, height: 110, fit: BoxFit.fill),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Have a good experience",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    "forever with us..",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 280,
              ),
              Center(
                child: defaultButton(
                  text: 'Sign Up',
                  textColor: Colors.white,
                  // buttonColor: Colors.cyan,

                  borderSideColor: Colors.white,
                  width: 250,
                  height: 60,
                  function: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return signUpScreen();
                    }));
                  },
                  borderSide: true,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: defaultButton(
                  text: 'Login',
                  textColor: Colors.cyan,
                  buttonColor: Colors.white,
                  borderSideColor: Colors.cyan,
                  width: 250,
                  height: 60,
                  function: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return loginScreen();
                    }));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
