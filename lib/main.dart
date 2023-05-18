import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'layout/Home_layout.dart';
import 'modules/splashScreen.dart';
import 'modules/welcomeScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Lora',),
      home: AnimatedSplashScreen(
          duration: 3000,
          splash: splashScreen(),
          nextScreen: Home_layout(),
        //     nextScreen: endTimeCalenderScreen(title: 'EndTime',),
          splashTransition: SplashTransition.rotationTransition,
          backgroundColor: Colors.cyan,
      )//Home_layout(),
    );
  }
}

