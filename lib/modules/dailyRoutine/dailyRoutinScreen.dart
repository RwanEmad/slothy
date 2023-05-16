import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../shared/components/component.dart';
import '../authentication/loginScreen.dart';
import 'newRoutineScreen.dart';

class dailyRoutinScreen extends StatefulWidget {
  const dailyRoutinScreen({Key? key}) : super(key: key);

  @override
  State<dailyRoutinScreen> createState() => _dailyRoutinScreenState();
}

class _dailyRoutinScreenState extends State<dailyRoutinScreen> {

  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var height = size.height; //392.72727272727275
    var width = size.width; //872.7272727272727
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 34, 34),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.menu_rounded,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                        Expanded(
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Daily",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Routin",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search_rounded,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 9,
                    primary: false,
                    //solution of slow scroll//////
                    itemBuilder: (context, index) {
                      return dailyRoutinCard(onCheckBoxChange: (checkBoxValue){setState(() {
                      });}, onTap: (){Navigator.push(
                          context, MaterialPageRoute(builder: (BuildContext context) {
                        return newRoutineScreen();
                      })); }, taskTitle: ["Azkar Esapah","gratitud time"],);
                    },
                  ),
                ],
              ),
            ),
          ),
          Stack(children: [
            Positioned(
              bottom: 30,
              right: width/14  ,
              left: width /14,
              child: ButtonTheme(
                height: 60,
                minWidth: 100,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return newRoutineScreen();
                        }));
                  },
                  color: Color.fromARGB(255, 25, 85, 113),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: Text(
                    "Creat your own",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),

    );
  }
}
