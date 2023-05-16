import 'package:flutter/material.dart';
import 'package:slothy/modules/dailyRoutine/dailyTaskScreen.dart';

import '../../shared/components/component.dart';
import '../../shared/style/styles.dart';

class newRoutineScreen extends StatefulWidget {
  const newRoutineScreen({Key? key}) : super(key: key);

  @override
  State<newRoutineScreen> createState() => _newRoutineScreenState();
}

class _newRoutineScreenState extends State<newRoutineScreen> {
  var routinTitleController = TextEditingController();
  String titleLable = "Routine Title";
  bool floatingLable = true;
  bool checkBoxValue=false;
  bool enabledBorder=false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                     padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                     child: Row(
                       mainAxisAlignment:MainAxisAlignment.start,
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
                        ],
                      ),
                   ),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
                    child:textFormField(
                        floatingLableColor:Color.fromARGB(255, 0, 0, 0) ,
                      inputTextSize: 28,
                      inputTextColor: Colors.black,
                      lableColor: Colors.black,
                      controller: routinTitleController,
                      lable:titleLable,
                       enabledBorder: enabledBorder,
                       floatingLable: floatingLable,
                       onSubmit: (){
                        setState(() {
                          floatingLable=false;
                          enabledBorder=false;
                        });
                    }
                   ),
                  ),

                   Padding(
                     padding: const EdgeInsets.only(top: 8.0),
                     child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 9,
                      primary: false,
                      //solution of slow scroll//////
                      itemBuilder: (context, index) {
                        return taskCard(
                            taskTitle: 'shower',
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (BuildContext context) {
                                    return dailyTaskScreen();
                                  }));
                            },
                            editOnPressed:(){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (BuildContext context) {
                                    return dailyTaskScreen();
                                  }));
                            },
                            checkBoxValue: checkBoxValue);
                      },
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
