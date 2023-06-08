import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';
import 'package:slothy/task/taskCubit/cubit.dart';
import 'package:slothy/task/taskCubit/states.dart';

import '../layout/Home_layout.dart';

class newTodayTask extends StatelessWidget {
  const newTodayTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("MM ,EEEE  dd     hh : mm");
    DateTime toDay = DateTime.now();

    var noteTitleController = TextEditingController();
    var noteController = TextEditingController();

    return BlocProvider(
      create: (context) => TaskCubit(),
      child: BlocConsumer<TaskCubit, TaskStates>(
        listener: (context, TaskStates state) {},
        builder: (context, state) {
          // TaskCubit taskCubit = TaskCubit.get(context);
          TaskCubit.get(context).mediaQuery(context);
          double height = TaskCubit.get(context).height!;
          return Scaffold(
            // backgroundColor:darkBackGround,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => homeScreen(),));
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Home_layout();
                    }));
                  },
                  icon: Icon(
                    Icons.restart_alt_outlined,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: IconButton(
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => homeScreen(),));
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return Home_layout();
                        }));
                      },
                      icon: Icon(Icons.done),
                    )),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row(
                      //   children: [
                      //     IconButton(
                      //       onPressed: () {
                      //         Navigator.pop(context);
                      //       },
                      //       icon: Icon(
                      //         Icons.arrow_back_ios_new_rounded,
                      //         color: Colors.white,
                      //         size: 30,
                      //       ),
                      //     ),
                      //     IconButton(
                      //       onPressed: () {
                      //       },
                      //       icon: Icon(
                      //         Icons.done_rounded,
                      //         color: Colors.white,
                      //         size: 30,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, right: 50),
                                  child: Container(
                                    width: 250,
                                    child: TextField(
                                      controller: noteTitleController,
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                      // TextStyle(
                                      //     color:
                                      //     fontSize: 18,
                                      //     fontWeight: FontWeight.w300,
                                      //     fontStyle: FontStyle.italic),
                                      onSubmitted: (s) {},
                                      minLines: 1,
                                      maxLines: 5,
                                      cursorColor: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      cursorHeight: 30,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    0, 76, 75, 75),
                                                width: 2)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    0, 76, 75, 75),
                                                width: 2)),
                                        fillColor:
                                            Color.fromARGB(122, 76, 75, 75),
                                        hintText: "Task",
                                        hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              100, 255, 255, 255),
                                          fontSize: 26,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Transform.scale(
                                  scale: 1.1,
                                  child: Checkbox(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      side: MaterialStateBorderSide.resolveWith(
                                          (states) => BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              width: 1)),
                                      checkColor: Colors.white,
                                      value:
                                          TaskCubit.get(context).checkBoxValue,
                                      activeColor: Colors.green,
                                      onChanged: (newvalue) {
                                        TaskCubit.get(context)
                                            .checkBox(newvalue);
                                      }),
                                ),
                              ],
                            ), //TitleField
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 10, right: 25),
                                  child: Text(
                                    dateFormat.format(toDay),
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    // TextStyle(
                                    //     color:Colors.white,
                                    //     //Color.fromARGB(195, 255, 255, 255),
                                    //     fontSize: 16,
                                    //     fontWeight: FontWeight.w300,
                                    //     fontStyle: FontStyle.italic),
                                  ),
                                ),
                                MaterialButton(
                                  height: 30,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  color: Colors.white24,
                                  onPressed: () {},
                                  child: Text(
                                    "Collection",
                                    style: TextStyle(
                                      color: Colors.white,
                                      //Color.fromARGB(195, 255, 255, 255),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: TextField(
                                controller: noteController,
                                style: Theme.of(context).textTheme.headline3,
                                // TextStyle(
                                //     color:white,
                                //     fontSize: 18,
                                //     fontWeight: FontWeight.w300,
                                //     fontStyle: FontStyle.italic),
                                onSubmitted: (s) {},
                                maxLines: 2,
                                cursorColor:
                                    Theme.of(context).colorScheme.secondary,
                                cursorHeight: 30,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(0, 76, 75, 75),
                                          width: 2)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(0, 76, 75, 75),
                                          width: 2)),
                                  fillColor: Color.fromARGB(122, 76, 75, 75),
                                  hintText: "Discreption",
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(100, 255, 255, 255),
                                    fontSize: 22,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    " Reminde me",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                FlutterSwitch(
                                  activeColor: Colors.greenAccent,
                                  width: 35.0,
                                  height: 20.0,
                                  valueFontSize: 20.0,
                                  toggleSize: 17.0,
                                  value: TaskCubit.get(context).switchValue,
                                  borderRadius: 45.0,
                                  padding: 0.0,
                                  showOnOff: false,
                                  onToggle: (val) {
                                    TaskCubit.get(context).switchButton(val);
                                  },
                                ),

                              ],
                            ),
                          ],
                        ),
                      ), ////noteText
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
