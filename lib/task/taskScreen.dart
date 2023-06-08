import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slothy/task/taskCubit/cubit.dart';
import 'package:slothy/task/taskCubit/states.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../layout/Home_layout.dart';
import '../models/models.dart';

import '../modules/note/addNoteScreen.dart';
import 'newTask.dart';
import 'newTaskCollection.dart';
import 'newTodayTask.dart';

class taskScreen extends StatelessWidget {
  const taskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: BlocConsumer<TaskCubit, TaskStates>(
        listener: (context, TaskStates state) {},
        builder: (context, state) {
          TaskCubit taskCubit = TaskCubit.get(context);
          taskCubit.mediaQuery(context);
          double height = taskCubit.height!;
          return Scaffold(
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
              title: Text(
                "ToDay Tasks",
              ),
              titleTextStyle: TextStyle(fontSize: 22),
              actions: [
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
            body: Stack(children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 35.0, left: 5, right: 5),
                  child: Container(
                    height: height - 100,
                    child: ReorderableListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: crumbsList.length,
                      primary: false,
                      onReorder: (int oldIndex, int newIndex) {
                        taskCubit.reOrderPeriority(oldIndex, newIndex);
                      },
                      itemBuilder: (context, index) {
                        return crumbsList[index] == '3 Calender'
                            ? Container(
                                //color: Theme.of(context).scaffoldBackgroundColor,
                                key: Key('$index'),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,right: 10,top:5,

                                  ),
                                  child: Column(
                                    children: [
                                      Card(
                                        elevation: 0,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        child: Row(
                                          children: [
                                            Text(
                                              "0/4.",
                                              style: TextStyle(
                                                color: Theme.of(context).colorScheme.error,
                                                fontSize: 18,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                " go to gym",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            FlutterSwitch(
                                              activeColor: Colors.greenAccent,
                                              width: 30.0,
                                              height: 20.0,
                                              valueFontSize: 20.0,
                                              toggleSize: 17.0,
                                              value: taskCubit.switchValue,
                                              borderRadius: 45.0,
                                              padding: 0.0,
                                              showOnOff: false,
                                              onToggle: (val) {
                                                taskCubit.switchButton(val);
                                              },
                                            ),
                                            Text(
                                              " Completed",
                                              style: Theme.of(context).textTheme.button,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 13.0, top: 10),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 220,
                                                  child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    shrinkWrap: true,
                                                    itemCount:
                                                        crumbsList.length,
                                                    primary: false,
                                                    //solution of slow scroll//////
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Container(
                                                        color: Theme.of(context)
                                                            .scaffoldBackgroundColor,
                                                        // decoration: BoxDecoration(
                                                        //   color: Color.fromARGB(198, 189, 160, 255),//Color.fromARGB(255, 242, 206, 239),//Color.fromARGB(255, 238, 191, 228)
                                                        //   //Color.fromARGB(255, 238, 191, 228)
                                                        //   borderRadius: BorderRadius.circular(10),
                                                        // ),
                                                        height: 60,
                                                        child: Card(
                                                          elevation: 0,
                                                          color: Colors.white10,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.all(Radius.circular(10))),
                                                          child: Row(
                                                            children: [
                                                              Transform.scale(
                                                                scale: 1.1,
                                                                child: Checkbox(
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(
                                                                            5)),
                                                                    side: MaterialStateBorderSide.resolveWith((states) => BorderSide(
                                                                        color: Theme.of(context)
                                                                            .colorScheme
                                                                            .secondary,
                                                                        width:
                                                                            1)),
                                                                    checkColor:
                                                                        Colors
                                                                            .white,
                                                                    value: taskCubit
                                                                        .checkBoxValue,
                                                                    activeColor:
                                                                        Colors
                                                                            .green,
                                                                    onChanged:
                                                                        (newvalue) {
                                                                      taskCubit
                                                                          .checkBox(
                                                                              newvalue);
                                                                    }),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  " go to gym",
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 18,
                                                                      fontWeight: FontWeight.w400),
                                                                ),
                                                              ),
                                                              IconButton(onPressed: (){}, icon:Icon(Icons.delete_outlined,size: 22,color:Colors.white54))
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 205.0),
                                                  child: MaterialButton(
                                                    onPressed: () {},
                                                    child: Row(children: [
                                                      Icon(Icons.add_rounded,color: Colors.white38,size: 25,),
                                                      Text("Add an item",
                                                         style: Theme.of(context).textTheme.button
                                                          // TextStyle(
                                                        //   fontSize: 16,
                                                        //   color:Colors.white38,
                                                        //   fontWeight: FontWeight.w400
                                                        // )
                                                         ,
                                                      )
                                                    ]),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                // decoration: BoxDecoration(
                                //   color: Color.fromARGB(198, 189, 160, 255),//Color.fromARGB(255, 242, 206, 239),//Color.fromARGB(255, 238, 191, 228)
                                //   //Color.fromARGB(255, 238, 191, 228)
                                //   borderRadius: BorderRadius.circular(10),
                                // ),
                                key: Key('$index'),
                                height: 60,
                                child: Card(
                                  elevation: 0,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: Row(
                                    children: [
                                      Transform.scale(
                                        scale: 1.1,
                                        child: Checkbox(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            side: MaterialStateBorderSide
                                                .resolveWith((states) =>
                                                    BorderSide(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .secondary,
                                                        width: 1)),
                                            checkColor: Colors.white,
                                            value: taskCubit.checkBoxValue,
                                            activeColor: Colors.green,
                                            onChanged: (newvalue) {
                                              taskCubit.checkBox(newvalue);
                                            }),
                                      ),
                                      Expanded(
                                        child: Text(
                                          " go to gym",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      IconButton(onPressed: (){}, icon:Icon(Icons.delete_outlined,size: 25,color:Colors.white54))
                                    ],
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 30,
                bottom: 30,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return newTodayTask();
                    }));
                  },
                  child: Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  backgroundColor: Colors.white60,
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
