import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/components/component.dart';
import '../../shared/style/colors.dart';
class addNoteScreen extends StatefulWidget {
  const addNoteScreen({Key? key}) : super(key: key);

  @override
  State<addNoteScreen> createState() => _addNoteScreenState();
}

class _addNoteScreenState extends State<addNoteScreen> {
  var noteTitleController = TextEditingController();
  var noteController = TextEditingController();
  String titleLable = "Title";
  bool floatingLable = true;
  bool enabledBorder = true;
  var white=Colors.white;

  DateFormat dateFormat=DateFormat("MM ,EEEE  dd     hh : mm");


  DateTime toDay=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor:darkBackGround,
      body: SafeArea(
        child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 220.0,right: 10),
                          child: IconButton(
                            onPressed: () {
                            },
                            icon: Icon(
                              Icons.keyboard_voice_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                          },
                          icon: Icon(
                            Icons.done_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:20.0),
                            child: TextField(
                              controller: noteTitleController,
                              style: TextStyle(
                                  color:white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic),
                              onSubmitted: (s){ },
                              minLines: 1,
                              maxLines: 5,
                              cursorColor:white,
                              cursorHeight: 30,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:BorderRadius.circular(10) ,
                                    borderSide: BorderSide(color: Color.fromARGB(
                                        0, 76, 75, 75), width: 2)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:BorderRadius.circular(10) ,
                                    borderSide: BorderSide(color: Color.fromARGB(
                                        0, 76, 75, 75), width: 2)),
                                fillColor: Color.fromARGB(122, 76, 75, 75),
                                hintText: "Title",
                                hintStyle: TextStyle(
                                  color:Color.fromARGB(100, 255, 255, 255),
                                  fontSize: 26,
                                  fontWeight: FontWeight.w300,

                                ),

                              ),
                            ),
                          ),//TitleField
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0,top: 10),
                                child: Text(dateFormat.format(toDay),style: TextStyle(
                                    color:Color.fromARGB(195, 255, 255, 255),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.italic),),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:15.0),
                            child: TextField(
                              controller: noteController,
                              style: TextStyle(
                                  color:white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic),
                              onSubmitted: (s){ },
                              minLines: 50,
                              maxLines: 100,
                              cursorColor:white,
                              cursorHeight: 30,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:BorderRadius.circular(10) ,
                                    borderSide: BorderSide(color: Color.fromARGB(
                                        0, 76, 75, 75), width: 2)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:BorderRadius.circular(10) ,
                                    borderSide: BorderSide(color: Color.fromARGB(
                                        0, 76, 75, 75), width: 2)),
                                fillColor: Color.fromARGB(122, 76, 75, 75),
                                hintText: "Start Typing",
                                hintStyle: TextStyle(
                                  color:Color.fromARGB(100, 255, 255, 255),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300,

                                ),

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),////noteText
                  ],
                ),
              ),
            ),
      ),
    );


  }
}
