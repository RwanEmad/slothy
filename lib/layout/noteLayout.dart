import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:slothy/modules/homeScreen.dart';
import 'package:slothy/modules/note/addNoteScreen.dart';
import 'package:slothy/modules/note/folders/foldersScreen.dart';
import 'package:slothy/modules/note/noteScreen.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

import '../modules/dailyRoutine/routinScreen.dart';
import '../shared/style/colors.dart';
import 'Home_layout.dart';

class noteLayout extends StatefulWidget {
  const noteLayout({Key? key}) : super(key: key);

  @override
  State<noteLayout> createState() => _noteLayoutState();
}

class _noteLayoutState extends State<noteLayout> {

  var buttonDisableTextColor = Colors.white24;
  var buttonEnableTextColor = Colors.white;
  bool boool = true;
 int counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 34, 34, 34),
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
       // title: Text(
       //    "Slothy",
       //  ),
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
                icon: Icon(Icons.home),
              ))
        ],
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(left: 8.0),
                //   child: IconButton(
                //     onPressed: () {
                //         // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                //         // return homeScreen();
                //        //  }
                //        //  )
                //        // );
                //     },
                //     icon: Icon(
                //       Icons.home,
                //       color: Colors.white,
                //       size: 30,
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0,left: 5),
                  child: Center(
                    child: ButtonsTabBar(
                      onTap: (p2) {
                        setState(() {
                          boool = false;
                          counter++;
                         //  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)
                         //  {
                         //    return dailyRoutinScreen();
                         //  }
                         // )
                        //);
                          print(counter);
                       },
                     );
                    },
                      height: 50,
                      borderWidth: 1,
                      radius: 25,
                      borderColor: Theme.of(context).colorScheme.secondary,
                      unselectedBorderColor: Theme.of(context).colorScheme.onSecondary,
                      backgroundColor:Colors.transparent,
                      unselectedBackgroundColor: Colors.transparent,
                      unselectedLabelStyle: TextStyle(color: Theme.of(context).textTheme.subtitle1?.color, fontSize: 20),
                      labelStyle: TextStyle(color: Theme.of(context).textTheme.headline1?.color, fontSize: 20,),
                      tabs: [
                        Tab(
                          text: "  All  20  ",
                        ),
                        Tab(
                          text: " important ",
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon(Icons.star),
                          ),
                        ),
                        Tab(
                            icon: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Icon(Icons.folder, size: 30,),
                            )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      noteScreen(),
                      noteScreen(),
                      foldersScreen(),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//
// DefaultTabController(
// length: 3,
// initialIndex: 0,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// TabBar(
// indicatorColor: Colors.green,
// tabs: [
// Tab(
// text: "Home",
// ),
// Tab(
// text: "Work",
// ),
// Tab(
// text: "Play",
// ),
// ],
// labelColor: Colors.black,
// indicator: RectangularIndicator(
// bottomLeftRadius: 100,
// bottomRightRadius: 100,
// topLeftRadius: 100,
// topRightRadius: 100,
// paintingStyle: PaintingStyle.stroke,
// ),
// ),
// ],
// ),
// ),

// MaterialButton(
// shape: RoundedRectangleBorder(
// side: BorderSide(color:buttonDisableTextColor,width: 2),
// borderRadius: BorderRadius.circular(45),
// ),
// onPressed: (){
// setState(() {
// return ;
// });
// },
// child: Text("All  20",style:TextStyle(color:buttonDisableTextColor),),
//
// )
