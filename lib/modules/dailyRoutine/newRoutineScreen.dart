import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:slothy/modules/dailyRoutine/dailyRoutineCubit/cubit.dart';
import 'package:slothy/modules/dailyRoutine/dailyRoutineCubit/states.dart';
import 'package:slothy/modules/dailyRoutine/newRoutineTaskScreen.dart';
import 'package:slothy/shared/cubit/cubit.dart';

import '../../layout/Home_layout.dart';
import '../../models/models.dart';
import '../../shared/components/component.dart';


class newRoutineScreen extends StatelessWidget {
  var routinTitleController = TextEditingController();
  final FloatingSearchBarController controller = FloatingSearchBarController();
  String titleLable = "Routine Title";


  bool enabledBorder = false;
  var white=Colors.white;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => dailyRoutineCubit(),
      child: BlocConsumer<dailyRoutineCubit,dailyRoutineStates>(
        listener: (context, dailyRoutineStates state) {},
        builder: (context, state) {

          dailyRoutineCubit  newRoutineCubit=dailyRoutineCubit.get(context);
          newRoutineCubit.mediaQuery(context);
          double height=newRoutineCubit.height!;
          return  Scaffold(
           // backgroundColor: Color.fromARGB(255, 34, 34, 34),
            // backgroundColor: Color.fromARGB(255, 255, 255, 255),
            appBar: AppBar(
              leading:IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:  Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                ),
              ),
              title: Text(
                "Create Routine",
              ),
              titleTextStyle: TextStyle(
                  fontSize: 22
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
                  icon: Icon(Icons.home),
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
              child: Stack(
                fit: StackFit.expand,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 10.0, vertical: 10),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     children: [
                        //       IconButton(
                        //         onPressed: () {
                        //           Navigator.pop(context);
                        //         },
                        //         icon: Icon(
                        //           Icons.arrow_back_ios_new_rounded,
                        //          // color: white,
                        //           size: 25,
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: Center(
                        //           child: Text(
                        //             "Create your routin",
                        //             style: Theme.of(context).textTheme.headline4,
                        //             // style: TextStyle(
                        //             //     color: white,
                        //             //     fontSize: 22,
                        //             //     fontWeight: FontWeight.w400,
                        //             //     fontStyle: FontStyle.italic),
                        //           ),
                        //         ),
                        //       ),
                        //       TextButton(
                        //           onPressed: () {},
                        //           child: Text(
                        //             "Save",
                        //             style:Theme.of(context).textTheme.headline1,
                        //             // style: TextStyle(
                        //             //     color: white,
                        //             //     fontSize: 22,
                        //             //     fontStyle: FontStyle.italic),
                        //           )),
                        //     ],
                        //   ),
                        // ),

                        //*******************************SearchBar******************************//
                        SizedBox(height: 40,),
                        Padding(
                            padding: const EdgeInsets.only(
                              left: 20,right: 20,top: 35,bottom: 0
                                //horizontal: 20.0, vertical: 10
                            ),
                            child: textFormField(
                              cursorColor: Theme.of(context).textTheme.headline4?.color,
                              lableColor:Theme.of(context).textTheme.headline4?.color,
                              inputTextColor:Theme.of(context).textTheme.headline4?.color,
                              lableSize: 26,
                              inputTextSize: 26,
                              fontWeight:FontWeight.w600,
                              controller: routinTitleController,
                              lable: titleLable,
                              floatingLable: newRoutineCubit.floatingLable,
                              onSubmit: () {
                                newRoutineCubit.enableFloatingLable();
                              },
                              onTap: () {
                                newRoutineCubit.enableFloatingLable();
                              },
                              enabledBorder: false,
                            )),/////////Routine Title

                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            height: height-305,
                            child: ReorderableListView.builder(

                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: crumbsList.length,
                              primary: false,
                              onReorder:
                               (int oldIndex, int newIndex) {
                                 newRoutineCubit.reOrderPeriority(oldIndex, newIndex);
                              },
                              itemBuilder:(context, index) {
                                return taskCard(
                                      context: context,
                                      checkBoxBorderColor: Theme.of(context).textTheme.headline4?.color,
                                      key: Key('$index'),
                                      taskTitle: crumbsList[index],
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return newRoutineTaskScreen();
                                            }));
                                      },
                                      editOnPressed: () {
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return newRoutineTaskScreen();
                                            }));
                                      },
                                      deleteOnPressed: () {
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return newRoutineTaskScreen();
                                            }));
                                      },
                                      checkBoxValue: newRoutineCubit.checkBoxValue,
                                      onChangedCheckBox: (newvalue){
                                        newRoutineCubit.checkBox(newvalue);
                                      }
                                );
                              },
                            ),
                          ),
                        ),///////dailyTasksReorderable


                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: ButtonTheme(
                              buttonColor: Theme.of(context).buttonTheme.colorScheme?.primary,
                              textTheme:Theme.of(context).buttonTheme.textTheme,
                              height: 60,
                              minWidth: 100,
                              child: MaterialButton(

                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return newRoutineTaskScreen();
                                      }));
                                },
                                color: Theme.of(context).buttonTheme.colorScheme?.primary,
                               // color: Color.fromARGB(255, 25, 85, 113),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  "Creat your own",
                                  style:Theme.of(context).textTheme.headline6,
                                  // style: TextStyle(
                                  //   fontSize: 22,
                                  //   fontWeight: FontWeight.w300,
                                  //   color: white,
                                  // ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      //top: 60.0,
                      right: 20,
                      left: 20,
                    ),
                    child: buildFloatingSearchBar(context,controller),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


