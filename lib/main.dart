import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slothy/shared/cubit/cubit.dart';
import 'package:slothy/shared/cubit/states.dart';
import 'package:slothy/shared/style/colors.dart';

import 'layout/Home_layout.dart';
import 'layout/noteLayout.dart';
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
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              // theme: ThemeData(fontFamily: 'Lora',),

              theme: ThemeData(
                //backgroundColor: white,
                //cupertinoOverrideTheme: MaterialBasedCupertinoThemeData(materialTheme: ThemeData(primaryColor: Colors.white)),
                colorScheme: ColorScheme(
                    brightness: Brightness.light,
                    primary: lavender,
                    onPrimary: lightLavender,
                    secondary: white,
                    onSecondary: Colors.white24,
                    error: Colors.red,
                    onError: Colors.redAccent,
                    background: darkBackGround,
                    onBackground: darkBackGround,
                    surface: baij,
                    onSurface: baij),
                navigationBarTheme: NavigationBarThemeData(
                  backgroundColor: Colors.transparent,
                  indicatorColor: Colors.cyan,
                ),
                //primarySwatch: Colors.deepPurple,
                scaffoldBackgroundColor: white,
                appBarTheme: AppBarTheme(),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.black38,

                ),
                textTheme: TextTheme(
                    subtitle1: TextStyle(
                      color: Colors.black26,
                      fontSize: 20,
                    ),
                    headline1: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                    //section title
                    headline2: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                    //goalsCard title & dailyHomeCard title
                    bodyText1: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    //goalsCard title & dailyHomeCard title
                    bodyText2: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                    //dates
                    headline3: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                    //menue title & routinCardContent
                    headline4: TextStyle(
                        color: Colors.black87,
                        fontSize: 24,
                        fontWeight: FontWeight.w400),
                    //routinCardTitle
                    headline5: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                    //inputTextFields
                    headline6: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w300)),
                buttonTheme: ButtonThemeData(
                  colorScheme: ColorScheme(
                      brightness: Brightness.dark,
                      primary:Color.fromARGB(255, 220, 195, 194),
                      onPrimary: brown,
                      secondary: purple,
                      onSecondary: baij,
                      error: Colors.red,
                      onError: Colors.red,
                      background: green,
                      onBackground: Colors.red,
                      surface: Colors.blue,
                      onSurface: yellow),
                  buttonColor: Colors.blue,
                  textTheme: ButtonTextTheme.accent,
                ),
                iconButtonTheme: IconButtonThemeData(
                    style: ButtonStyle(
                      iconColor: MaterialStatePropertyAll(
                        black,
                      ),
                      iconSize: MaterialStatePropertyAll(40),
                    )),
                iconTheme: IconThemeData(
                  color: Colors.black,
                  size: 30,
                ),
              ),
              darkTheme: ThemeData(
                cupertinoOverrideTheme: MaterialBasedCupertinoThemeData(materialTheme: ThemeData(primaryColor: Colors.white)),
                colorScheme: ColorScheme(
                    brightness: Brightness.dark,
                   // primary: Color.fromARGB(255, 221, 184, 146),
                    primary: baij,
                    onPrimary:Color.fromARGB(114, 227, 227, 227),
                    secondary: white,
                    onSecondary: Colors.white24,
                    error: Colors.white54,
                    onError: Colors.redAccent,
                    background: darkBackGround,
                    onBackground: darkBackGround,
                    surface: black,
                    onSurface: baij),
                navigationBarTheme: NavigationBarThemeData(
                  backgroundColor: Colors.transparent,
                  indicatorColor: Colors.cyan,
                ),
                //primarySwatch: Colors.deepPurple,
                scaffoldBackgroundColor: darkBackGround,
                appBarTheme: AppBarTheme(
                  color: darkBackGround,
                  elevation: 0,
                  iconTheme: IconThemeData(
                    color: Colors.white,
                    size: 35,

                  ),
                  centerTitle: true,
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600
                  )

                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.white30,

                ),
                textTheme: TextTheme(
                    subtitle1: TextStyle(
                    color: Colors.white24,
                    fontSize: 20,
                  ),
                    headline1: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                    //section title
                    headline2: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                    //goalsCard title & dailyHomeCard title
                    bodyText1: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    //goalsCard title & dailyHomeCard title
                    bodyText2: TextStyle(
                        color: Colors.white60,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                    //dates
                    headline3: TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                    //menue title & routinCardContent
                    headline4: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400),
                    //routinCardTitle
                    headline5: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                    //inputTextFields
                    headline6: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w300),
                    button:  TextStyle(
                        color: Colors.white38,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                ),
                buttonTheme: ButtonThemeData(
                  colorScheme: ColorScheme(
                      brightness: Brightness.dark,
                      primary: baij,
                      onPrimary: brown,
                      secondary: purple,
                      onSecondary: baij,
                      error: Colors.red,
                      onError: Colors.red,
                      background: green,
                      onBackground: Colors.red,
                      surface: Colors.blue,
                      onSurface: yellow),
                  buttonColor: Colors.blue,
                  textTheme: ButtonTextTheme.accent,
                ),
                iconButtonTheme: IconButtonThemeData(
                    style: ButtonStyle(
                  iconColor: MaterialStatePropertyAll(
                    white,
                  ),
                  iconSize: MaterialStatePropertyAll(40),
                )),
                iconTheme: IconThemeData(
                  color: Colors.white,
                  size: 30,
                ),
              ),
              themeMode: AppCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: AnimatedSplashScreen(
                duration: 3000,
                splash: splashScreen(),
                // nextScreen: noteLayout(),
                nextScreen: welcomeScreen(),

                //     nextScreen: endTimeCalenderScreen(title: 'EndTime',),
                splashTransition: SplashTransition.rotationTransition,
                backgroundColor: Colors.cyan,
              ) //Home_layout(),
              );
        },
      ),
    );
  }
}
