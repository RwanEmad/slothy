import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../modules/note/folders/foldersScreen.dart';
import '../modules/note/noteScreen.dart';
class folderContentLayout extends StatefulWidget {
  const folderContentLayout({Key? key}) : super(key: key);

  @override
  State<folderContentLayout> createState() => _folderContentLayoutState();
}

class _folderContentLayoutState extends State<folderContentLayout> {
  var white = Colors.white;
  var buttonDisableTextColor = Colors.white24;
  var buttonEnableTextColor = Colors.white;
  bool boool = true;
  int counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 34, 34, 34),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
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
                      borderColor: white,
                      unselectedBorderColor: Colors.white24,
                      backgroundColor: Colors.transparent,
                      unselectedBackgroundColor: Colors.transparent,
                      unselectedLabelStyle: TextStyle(
                          color: Colors.white24, fontSize: 20),
                      labelStyle: TextStyle(color: Colors.white, fontSize: 20,),
                      tabs: [
                        Tab(
                          text: "  Note  20  ",
                            icon: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Icon(Icons.note_alt_rounded, size: 30,),
                            )
                        ),
                        Tab(
                            icon: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Icon(Icons.folder, size: 30,),
                            )
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      noteScreen(),
                      foldersScreen(),//shows subFolders frome fireBase
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
