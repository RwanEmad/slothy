import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:slothy/layout/folderContentLayout.dart';
import 'package:slothy/shared/style/colors.dart';
import '../../../models/models.dart';
import '../addNoteScreen.dart';
class foldersScreen extends StatefulWidget {
  const foldersScreen({Key? key}) : super(key: key);

  @override
  State<foldersScreen> createState() => _foldersScreenState();
}

class _foldersScreenState extends State<foldersScreen> {
  late PullDownMenuButtonBuilder builder;
  var noteTitleController = TextEditingController();
  bool showCreateFolder = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, left: 20.0, right: 20, bottom: 5),
                child: Container(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 30,
                    primary: false,
                    //solution of slow scroll//////
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return folderContentLayout();
                            }));
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.folder,
                                 // color: Colors.white,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Text(
                                    "name",
                                    style: TextStyle(
                                      color: Theme.of(context).textTheme.headline1?.color,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                PullDownButton(
                                  itemBuilder: (context) => [
                                    PullDownMenuItem(
                                     // iconColor: Colors.black,
                                      icon: Icons.folder_open_rounded,
                                      title: 'Move this Folder',
                                      onTap: () {},
                                    ),
                                    const PullDownMenuDivider(),
                                    PullDownMenuItem(
                                     // iconColor: Colors.black,
                                      icon: Icons.mode_edit_outline_outlined,
                                      title: 'Rename',
                                      onTap: () {},
                                    ),
                                    PullDownMenuItem(
                                      iconColor: Colors.red,
                                      icon: Icons.delete_outline_rounded,
                                      title: 'Delete',
                                      onTap: () {},
                                    ),
                                  ],
                                  buttonBuilder: (context, showMenu) =>
                                      CupertinoButton(
                                    onPressed: showMenu,
                                    padding: EdgeInsets.zero,
                                    child: const Icon(
                                      Icons.more_vert_rounded,
                                      color: white,
                                      size: 25,
                                    ),
                                  ),
                                ),
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
        ),
        Positioned(
          right: 30,
          bottom: 10,
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                showCreateFolder = true;
              });
            },
            child: Icon(
              Icons.create_new_folder_outlined,
              color: Colors.white,
              size: 30,
            ),
            //backgroundColor: Colors.white30,
          ),
        ),
        showCreateFolder
            ? Center(
                child: Container(
                  height: 190,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 216, 216, 216),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "create new folder :",
                          style: TextStyle(fontSize: 18, color: Colors.black87),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 17, top: 25),
                          child: TextField(
                            controller: noteTitleController,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic),
                            onSubmitted: (s) {},
                            minLines: 1,
                            cursorColor: Colors.black,
                            cursorHeight: 30,
                            decoration: InputDecoration(
                              filled: true,
                              enabledBorder: UnderlineInputBorder(
                                  // borderRadius:BorderRadius.circular(10),
                                  // borderSide: BorderSide(color: Color.fromARGB(225, 48, 48, 48), width: 2)
                                  ),
                              focusedBorder: UnderlineInputBorder(
                                  // borderRadius:BorderRadius.circular(10) ,
                                  // borderSide: BorderSide(color: Color.fromARGB(
                                  //     0, 76, 75, 75), width: 2)
                                  ),
                              fillColor: Color.fromARGB(255, 244, 244, 244),
                              hintText: "Folder Name ",
                              hintStyle: TextStyle(
                                color: Color.fromARGB(255, 156, 156, 156),
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        showCreateFolder = false;
                                      });
                                    },
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 18,
                                      ),
                                    )),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Expanded(
                                child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        showCreateFolder = false;
                                      });
                                    },
                                    child: Text(
                                      "Create",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 18,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : Container(
                color: Colors.white,
                height: 0,
              ),
      ]),
    );
  }
}
