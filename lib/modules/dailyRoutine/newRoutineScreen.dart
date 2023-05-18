import 'package:flutter/material.dart';
import 'package:slothy/modules/dailyRoutine/newDailyTaskScreen.dart';

import '../../shared/components/component.dart';


class newRoutineScreen extends StatefulWidget {
  const newRoutineScreen({Key? key}) : super(key: key);

  @override
  State<newRoutineScreen> createState() => _newRoutineScreenState();
}

class _newRoutineScreenState extends State<newRoutineScreen> {
  var routinTitleController = TextEditingController();

  String titleLable = "Routine Title";
  bool floatingLable = true;
  bool checkBoxValue = false;
  bool enabledBorder = false;
 List crumbsList=[
  '1 Daily habits  Daily habits',
  '2 Goals Daily habits',
  '3 Calender',
  '4 Gratitude time',
  '5 Calender',
  '6 Gratitude time',
 '7 Calender',
  '8 Gratitude time',
  '9 Calender',
  '10 Gratitude time',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    var height = size.height; //392.72727272727275
    var width = size.width; //872.7272727272727

    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 34, 34, 34),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.menu_rounded,
                            color: Colors.black,
                            size: 35,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Create your routin",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontStyle: FontStyle.italic),
                            )),
                      ],
                    ),
                  ),

                  //*******************************SearchBar******************************//

                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: textFormField(
                        lableColor: Color.fromARGB(255, 0, 0, 0),
                        inputTextColor: Color.fromARGB(255, 0, 0, 0),
                        lableSize: 26,
                        inputTextSize: 26,
                        // fontWeight:FontWeight.w600,
                        controller: routinTitleController,
                        lable: titleLable,
                        floatingLable: floatingLable,
                        onSubmit: () {
                          setState(() {
                            floatingLable = false;
                          });
                        },
                        onTap: () {
                          setState(() {
                            floatingLable = true;
                          });
                        },
                        enabledBorder: false,
                      )),/////////Routine Title


                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      height: height - 260,
                      child: ReorderableListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: crumbsList.length,
                        primary: false,
                        onReorder: (int oldIndex, int newIndex) {

                            setState(() {
                              if (newIndex > oldIndex) newIndex-=1;
                              var tmp = crumbsList[oldIndex];
                              crumbsList.removeAt(oldIndex);
                              crumbsList.insert(newIndex, tmp);
                            });

                        },
                        itemBuilder:(context, index) {
                          return
                            taskCard(
                               key: Key('$index'),
                                taskTitle: crumbsList[index],
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return newDailyTaskScreen();
                                      }));
                                },
                                editOnPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return newDailyTaskScreen();
                                      }));
                                },
                                deleteOnPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return newDailyTaskScreen();
                                      }));
                                },
                                checkBoxValue: checkBoxValue);
                        },
                      ),
                    ),
                  ),///////dailyTasksReorderable


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
                                  return newDailyTaskScreen();
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
          ),
        ],
      ),
    );
  }
}
