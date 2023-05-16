import 'package:flutter/material.dart';

import '../../shared/style/colors.dart';

class settingsScreen extends StatefulWidget {
  const settingsScreen({Key? key}) : super(key: key);

  @override
  State<settingsScreen> createState() => _settingsScreenState();
}

class _settingsScreenState extends State<settingsScreen> {
  @override
  List sittingsTitle = ['Theme', 'Rules', 'Notifications', 'About Us', 'Help'];

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 90,
            width: double.infinity,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: lavander,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: IconButton(
                          onPressed: () {

                          },
                          icon: Icon(Icons.arrow_back_rounded),
                          color: Colors.white,
                          iconSize: 40),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Settings',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: sittingsTitle.length,
            itemBuilder: (context, index) {
              return ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onTap: () {
                  print(sittingsTitle[index]);
                },
                title: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    sittingsTitle[index],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 5,
              );
            },
          ),
        ],
      ),
    );
  }
}
