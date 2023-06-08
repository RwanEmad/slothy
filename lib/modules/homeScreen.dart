import 'package:flutter/material.dart';
import 'package:slothy/layout/noteLayout.dart';
import 'package:slothy/modules/calender/calenderScreen.dart';
import 'package:slothy/modules/dailyRoutine/routinScreen.dart';
import 'package:slothy/modules/goals/goalsScreen.dart';
import 'package:slothy/modules/welcomeScreen.dart';
import '../models/models.dart';
import '../shared/components/component.dart';
import '../task/taskScreen.dart';
import 'dailyRoutine/newRoutineScreen.dart';
import 'gratitude/gratitudeScreen.dart';
import 'homeMenueScreen.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  TextEditingController searchTextController = TextEditingController();
  var white=Colors.white;
  var dailyDefaultRoutineColor=[
    Color.fromARGB(184, 152, 200, 244),//'Morning Routin',
    Color.fromARGB(149, 127, 104, 153),// 'Evening Routin',
    Color.fromARGB(168, 196, 144, 217),// 'Sport Routin',
    Color.fromARGB(167, 152, 203, 175),// 'Challeng Routin ',
  ];
  var homeIcons=[
    Icon(Icons.task_rounded,size: 45,),
    Icon(Icons.note_alt_rounded,size: 45,),
    Icon(Icons.calendar_month_rounded,size: 45,),
    ImageIcon(
      AssetImage("assets/icons/recovery.png"),
      size: 40,
      //color: Theme.of(context).iconTheme.color,
    ),
    //"My Routine",
    ImageIcon(
      AssetImage("assets/icons/dart-board.png"),
      size: 40,
     // color: Theme.of(context).iconTheme.color,
    ),
    //"My Goals",
    Icon(Icons.task_rounded,size: 45,),

  ];
  var homeIconTitles=[
    "Tasks",
    "Note",
    "Calender",
    "Routine",
    "Goals",
    "Challenge"
  ];
  var screensList=[
    taskScreen(),
    noteLayout(),
    calenderScreen(),
    dailyRoutinScreen(),
    goalsScreen(),
    gratitudeScreen(),
  ];
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Center(
              //     child: Padding(
              //       padding: const EdgeInsets.only(
              //
              //         right: 10,
              //         top: 15.0,
              //       ),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           IconButton(
              //             onPressed: () {
              //               Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                       builder: (BuildContext) => homeMenueScreen()));
              //             },
              //             icon: Icon(
              //               Icons.menu_rounded,
              //               //color: white,
              //               size: 35,
              //             ),
              //           ),
              //           Expanded(
              //             child: Center(
              //                 child: Padding(
              //                   padding: const EdgeInsets.only(),
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     children: [
              //                       Text(
              //                         "Sl",
              //                         style: TextStyle(
              //                             color: Colors.white,
              //                             fontSize: 28,
              //                             fontWeight: FontWeight.w600),
              //                       ),
              //                       Image.asset(
              //                         "assets/logo/img.png",
              //                         height: 35,
              //                         width: 35,
              //                       ),
              //                       Text(
              //                         "thy",
              //                         style: TextStyle(
              //                             color: Colors.white,
              //                             fontSize: 28,
              //                             fontWeight: FontWeight.w600),
              //                       ),
              //                     ],
              //                   ),
              //                 )),
              //           ),
              //         ],
              //       ),
              //     )),
              // SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 5,),
                child: Container(
                  width: double.infinity,
                  height: 130,
                  child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: homeIconTitles.length,
                    primary: false,
                    //solution of slow scroll//////
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (BuildContext context) {
                                  return screensList[index];
                                }));
                          },
                          child: Container(
                            width: 90,
                            child: Card(
                              child:Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    homeIcons[index],
                                    Padding(
                                      padding: const EdgeInsets.only(top:8.0),
                                      child: Center(
                                        child: Text(homeIconTitles[index],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              color: Theme.of(context).colorScheme.primary,
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(15))),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10,left: 15),
                child: Row(
                  children: [
                    // SizedBox(
                    //   width: 40,
                    // ),
                    Text(
                      "My Routine...",
                      style:Theme.of(context).textTheme.headline1
                      // TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 22,
                      //     fontWeight: FontWeight.w600),
                    ,
                    ),
                    SizedBox(
                      width: 145,
                    ),
                    Expanded(
                      child: IconButton(
                          iconSize: 40,
                          //color: white,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (BuildContext context) {
                                  return dailyRoutinScreen();
                                }));
                          },
                          icon: Icon(
                            Icons.edit_note_rounded,

                          )),
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: dailyTitleList.length,
                  primary: false,
                  //solution of slow scroll//////
                  itemBuilder: (context, index) {
                    return dailyHomeCard(
                      title: dailyTitleList[index],
                      backGroundColor: dailyDefaultRoutineColor[index],
                      ontap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return newRoutineScreen();
                            }));
                      }, context: context,
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only( bottom: 10,left: 15,top: 10),
                child: Row(
                  children: [
                    Text(
                      "Your Goals",
                        style:Theme.of(context).textTheme.headline1,
                      // style: TextStyle(
                      //     color: white,
                      //     fontSize: 22,
                      //     fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon:  ImageIcon(
                          AssetImage("assets/icons/dart-board.png"),
                          // color: white,
                          //size:40,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 230,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: goalsList.length,
                    scrollDirection: Axis.horizontal,
                    primary: false,
                    //solution of slow scroll//////
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return goalsCard(
                          taskTitle: goalsList[index],
                          crumbTitlesList: crumbsList,
                          rule: rulesList[index], context: context);
                    }),
              ), //your Goals
            ],
          ),
        ));
  }
}
