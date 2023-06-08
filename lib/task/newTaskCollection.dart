import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';
import 'package:slothy/task/newTodayTask.dart';
import 'package:slothy/task/taskCubit/cubit.dart';
import 'package:slothy/task/taskCubit/states.dart';

import '../layout/Home_layout.dart';
import '../models/models.dart';
class newTaskCollection extends StatelessWidget {
  const newTaskCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("MM ,EEEE  dd     hh : mm");
    DateTime toDay = DateTime.now();

    var collectionTitleController = TextEditingController();
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
                           
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: TextField(
                                controller: collectionTitleController,
                                style: Theme.of(context).textTheme.headline3,
                                // TextStyle(
                                //     color:
                                //     fontSize: 18,
                                //     fontWeight: FontWeight.w300,
                                //     fontStyle: FontStyle.italic),
                                onSubmitted: (s) {},
                                minLines: 1,
                                maxLines: 5,
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
                                  hintText: "Collection title",
                                  hintStyle: TextStyle(
                                    color: Colors.white54,//Color.fromARGB(100, 255, 255, 255),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ), //TitleField
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, top: 10,right: 25),
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
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2,right: 10),
                                  child:
                                FlutterSwitch(
                                  activeColor: Colors.greenAccent,
                                  width: 30.0,
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
                               )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 14.0),
                              child: Row(
                                children: [
                                  Text(
                                    "0/4",
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.error,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      color: Colors.white10,
                                      height: 1,
                                      width: 165,
                                    ),
                                  ),
                                  MaterialButton(
                                    height: 30,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))) ,
                                    color: Colors.white24,
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (BuildContext context) {
                                            return newTodayTask();
                                          }));
                                    },
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
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 15.0),
                            //   child: TextField(
                            //     controller: noteController,
                            //     style: Theme.of(context).textTheme.headline3,
                            //     // TextStyle(
                            //     //     color:white,
                            //     //     fontSize: 18,
                            //     //     fontWeight: FontWeight.w300,
                            //     //     fontStyle: FontStyle.italic),
                            //     onSubmitted: (s) {},
                            //     maxLines: 2,
                            //     cursorColor:
                            //     Theme.of(context).colorScheme.secondary,
                            //     cursorHeight: 30,
                            //     decoration: InputDecoration(
                            //       enabledBorder: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(10),
                            //           borderSide: BorderSide(
                            //               color: Color.fromARGB(0, 76, 75, 75),
                            //               width: 2)),
                            //       focusedBorder: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(10),
                            //           borderSide: BorderSide(
                            //               color: Color.fromARGB(0, 76, 75, 75),
                            //               width: 2)),
                            //       fillColor: Color.fromARGB(122, 76, 75, 75),
                            //       hintText: "Discreption",
                            //       hintStyle: TextStyle(
                            //         color: Color.fromARGB(100, 255, 255, 255),
                            //         fontSize: 22,
                            //         fontWeight: FontWeight.w300,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(top: 35.0, left: 5, right: 5),
                              child: Container(
                                height: height - 100,
                                child: ReorderableListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount:5,
                                  primary: false,
                                  onReorder: (int oldIndex, int newIndex) {
                                    TaskCubit.get(context).reOrderPeriority(oldIndex, newIndex);
                                  },
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      key: Key('$index'),
                                      onTap: (){

                                      },
                                      child: Container(
                                        color:
                                        Theme.of(context).scaffoldBackgroundColor,
                                        // decoration: BoxDecoration(
                                        //   color: Color.fromARGB(198, 189, 160, 255),//Color.fromARGB(255, 242, 206, 239),//Color.fromARGB(255, 238, 191, 228)
                                        //   //Color.fromARGB(255, 238, 191, 228)
                                        //   borderRadius: BorderRadius.circular(10),
                                        // ),

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
                                                    value: TaskCubit.get(context).checkBoxValue,
                                                    activeColor: Colors.green,
                                                    onChanged: (newvalue) {
                                                      TaskCubit.get(context).checkBox(newvalue);
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
                                              Center(child: IconButton(onPressed: (){}, icon:Center(child: Icon(Icons.minimize_rounded,size: 25,color:Colors.white54))))
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
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
