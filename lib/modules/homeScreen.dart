import 'package:flutter/material.dart';
import 'package:slothy/modules/dailyRoutine/dailyRoutinScreen.dart';
import 'package:slothy/modules/welcomeScreen.dart';
import '../models/models.dart';
import '../shared/components/component.dart';
import 'dailyRoutine/newRoutineScreen.dart';
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
    Color.fromARGB(255, 119, 204, 238),//'Morning Routin',
    Color.fromARGB(255, 76, 57, 104),// 'Evening Routin',
    Color.fromARGB(255, 176, 115, 200),// 'Sport Routin',
    Color.fromARGB(255, 112, 196, 157),// 'Challeng Routin ',
  ];
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.only(

              right: 10,
              top: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext) => homeMenueScreen()));
                  },
                  icon: Icon(
                    Icons.menu_rounded,
                    color: white,
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
                          "Sl",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w600),
                        ),
                        Image.asset(
                          "assets/logo/img.png",
                          height: 35,
                          width: 35,
                        ),
                        Text(
                          "thy",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )),
                ),
              ],
            ),
          )),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, Good Morning",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Text(
                          "Slothy",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                        Image.asset(
                          "assets/icons/love-letter.png",
                          height: 35,
                          width: 35,
                        )
                      ],
                    ),
                  ],
                ),
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
                  "Your Daily Routine...",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 75,
                ),
                Expanded(
                  child: IconButton(
                      iconSize: 40,
                      color: white,
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
                  },
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
                  style: TextStyle(
                      color: white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 150,
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon:  ImageIcon(
                      AssetImage("assets/icons/dart-board.png"),
                      color: white,
                      size:40,
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
                      rule: rulesList[index]);
                }),
          ), //your Goals
        ],
      ),
    ));
  }
}
