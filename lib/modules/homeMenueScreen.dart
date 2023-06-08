import 'package:flutter/material.dart';
import 'package:slothy/models/models.dart';

class homeMenueScreen extends StatefulWidget {
  const homeMenueScreen({Key? key}) : super(key: key);

  @override
  State<homeMenueScreen> createState() => _homeMenueScreenState();
}

class _homeMenueScreenState extends State<homeMenueScreen> {
  bool haveNotifi = true;

  // List<Widget> homeMenueIcons = [
  //   Icon(Icons.home, color: Theme.of(context).iconTheme.color, size: 25),
  //   //"Home",
  //   Icon(Icons.note_alt, color: Colors.white, size: 25),
  //   //"Note",
  //   Icon(Icons.calendar_today_outlined, color: Colors.white, size: 25),
  //   //"Calender",
  //   Icon(Icons.person, color: Colors.white, size: 25),
  //   //"My Profile",
  //   ImageIcon(
  //     AssetImage("assets/icons/dart-board.png"),
  //     size: 25,
  //     color: Colors.white,
  //   ),
  //   //"My Goalsew",
  //   ImageIcon(
  //     AssetImage("assets/icons/recovery.png"),
  //     size: 25,
  //     color: Colors.white,
  //   ),
  //   //"My Routine",
  //   Icon(Icons.account_circle_rounded, color: Colors.white, size: 25),
  //   //"Calenges",
  //   Icon(Icons.settings_rounded, color: Colors.white, size: 25),
  //   //"Settings",
  // ];

  List haveNotification = [
    false,
    false,
    false,
    true,
    false,
    false,
    true,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 10),
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close_rounded,
                  // color: Colors.white60,
                  // size: 30,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            maxRadius: 40,
                            backgroundImage:
                                AssetImage("assets/images/background.jpg"),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 230,
                                height: 80,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(162, 255, 255, 255),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Padding(
                                    padding: EdgeInsetsDirectional.only(
                                      start: 15,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Profile name",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          "name@gmail.com",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: MaterialButton(
                                    height: 40,
                                    color: Colors.white12,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Edit Profile",
                                      style: TextStyle(
                                        color: Colors.white38,
                                        fontSize: 14,
                                        //fontWeight: FontWeight.w300
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                // SizedBox(width: 15,),
                                MaterialButton(
                                  height: 40,
                                  color: Colors.white12,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text(
                                      "Logout",
                                      style: TextStyle(
                                        color: Colors.white38,
                                        fontSize: 14,
                                        //fontWeight: FontWeight.w300
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 2,
                      color: Colors.white12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: homeMenue.length,
                      primary: false,
                      itemBuilder: (context, index) {
                        //ImageIcon(AssetImage(homeMenueImageIcons[index]),color: Colors.white,size: 10,),//:
                        return ListTile(
                          leading: menueIcons(index,context),
                          //homeMenueIcons[index],
                          //Icon(homeMenueIcons[index],color: Colors.white,size: 20),
                          title: Text(
                            homeMenue[index],
                            style: Theme.of(context).textTheme.headline3,
                            // style: TextStyle(
                            //     color: Colors.white,
                            //     fontSize: 18,
                            //     fontWeight: FontWeight.w300),
                          ),
                          trailing: haveNotification[index] == true
                              ? CircleAvatar(
                                  radius: 10,
                                  backgroundColor:
                                      Color.fromARGB(162, 255, 255, 255),
                                  child: Text(
                                    "7",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              : null,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget menueIcons(index , context){
    List<Widget> homeMenueIcons = [
      Icon(Icons.home, color: Theme.of(context).iconTheme.color, size: 25),
      //"Home",
      Icon(Icons.note_alt, color: Theme.of(context).iconTheme.color, size: 25),
      //"Note",
      Icon(Icons.calendar_today_outlined, color: Theme.of(context).iconTheme.color, size: 25),
      //"Calender",
      Icon(Icons.person,color: Theme.of(context).iconTheme.color, size: 25),
      //"My Profile",
      ImageIcon(
        AssetImage("assets/icons/dart-board.png"),
        size: 25,
        color: Theme.of(context).iconTheme.color,
      ),
      //"My Goals",
      ImageIcon(
        AssetImage("assets/icons/recovery.png"),
        size: 25,
        color: Theme.of(context).iconTheme.color,
      ),
      //"My Routine",
      Icon(Icons.account_circle_rounded, color: Theme.of(context).iconTheme.color, size: 25),
      //"Calenges",
      Icon(Icons.settings_rounded, color: Theme.of(context).iconTheme.color, size: 25),
      //"Settings",
    ];

    return homeMenueIcons[index];
  }

}
