import 'package:flutter/material.dart';
import 'package:slothy/modules/dailyRoutine/dailyRoutinScreen.dart';
import 'package:slothy/modules/welcomeScreen.dart';
import '../models/models.dart';
import '../shared/components/component.dart';
import 'dailyRoutine/newRoutineScreen.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
            ),
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
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                ),
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
                IconButton(
                    iconSize: 40,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return dailyRoutinScreen();
                          }));
                    },
                    icon: Icon(
                      Icons.edit_note_rounded,
                    )),
              ],
            ),
          ),
          Container(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: dailyTitleList.length,
              primary: false,
              //solution of slow scroll//////
              itemBuilder: (context, index) {
                return dailyHomeCard(
                  title: dailyTitleList[index],
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
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 40,
              ),
              Text(
                "Your Goals",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 150,
              ),
              MaterialButton(
                onPressed: () {},
                child: Image.asset(
                  "assets/icons/dart-board.png",
                  color: Colors.white,
                  width: 35,
                  height: 35,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 400,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: goalsList.length,
                scrollDirection: Axis.vertical,
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
