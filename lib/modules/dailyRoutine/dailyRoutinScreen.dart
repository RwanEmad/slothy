import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../shared/components/component.dart';
import '../authentication/loginScreen.dart';
import 'newRoutineScreen.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class dailyRoutinScreen extends StatefulWidget {
  const dailyRoutinScreen({Key? key}) : super(key: key);

  @override
  State<dailyRoutinScreen> createState() => _dailyRoutinScreenState();
}

class _dailyRoutinScreenState extends State<dailyRoutinScreen> {
  bool checkBoxValue = false;
  final FloatingSearchBarController controller = FloatingSearchBarController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var height = size.height; //392.72727272727275
    var width = size.width; //872.7272727272727
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 34, 34),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                          size: 25,
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

                //*******************************SearchBar******************************//

                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Text(
                          "Manage Your Repetitive Tasks And Make Your Routine",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        height: height - 300,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: dailyTitleList.length,
                          primary: false,
                          //solution of slow scroll//////
                          itemBuilder: (context, index) {
                            return dailyRoutinCard(
                              Title: dailyTitleList[index],
                              onCheckBoxChange: (checkBoxValue) {
                                setState(() {});
                              },
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return newRoutineScreen();
                                }));
                              },
                            );
                          },
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: ButtonTheme(
                            height: 60,
                            minWidth: 100,
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 55.0,
                  right: 20,
                  left: 20,
              ),
              child: buildFloatingSearchBar(context,controller),
            ),
          ]),
        ),
      ),
    );
  }

}
