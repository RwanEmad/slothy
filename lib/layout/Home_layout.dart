import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../models/models.dart';
import '../modules/homeScreen.dart';
import '../modules/setting/settingsScreen.dart';
class Home_layout extends StatefulWidget {
  const Home_layout({Key? key}) : super(key: key);

  @override
  State<Home_layout> createState() => _Home_layoutState();
}

class _Home_layoutState extends State<Home_layout> {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: Color.fromARGB(255, 34, 34, 34),
        body:
            Column(
              children: [
                Expanded(
                  flex: 9,
                  child:  toggelScreensList[currentIndex],
                ),
                Expanded(
                  flex:1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0,left:30,bottom: 25),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      clipBehavior:Clip.antiAliasWithSaveLayer ,
                      child: GNav(
                        backgroundColor: Color.fromARGB(255, 151, 123, 108),
                        curve:Curves.linearToEaseOut,
                        activeColor: Color.fromARGB(255, 55, 45, 36,),
                        iconSize: 24,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        duration: Duration(milliseconds: 400),
                        tabBackgroundColor: Color.fromARGB(255, 221, 184, 146),
                        color: Colors.black,
                        tabs: [
                          GButton(
                            icon: Icons.home,
                            text: 'Home',
                            textStyle: TextStyle(fontSize:16,fontWeight: FontWeight.bold,),
                          ),
                          GButton(
                            icon: Icons.calendar_month_rounded,
                            text: 'Calender',
                            textStyle: TextStyle(fontSize:16,fontWeight: FontWeight.bold,),
                          ),
                          GButton(
                            icon: Icons.account_circle_rounded,
                            text: 'Profile',
                          ),
                          GButton(
                            icon: Icons.settings_rounded,
                            text: 'Settings',
                          ),
                        ],
                        selectedIndex: currentIndex,
                        onTabChange: (index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),//navigation Bar
                ),
              ],
            ),

      );
    }

}




