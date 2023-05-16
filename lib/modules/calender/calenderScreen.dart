import 'package:flutter/material.dart';
class calenderScreen extends StatefulWidget {
  const calenderScreen({Key? key}) : super(key: key);

  @override
  State<calenderScreen> createState() => _calenderScreenState();
}

class _calenderScreenState extends State<calenderScreen> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text("calenderScreen", style: TextStyle(
        color: Colors.cyan, fontSize: 40, fontWeight: FontWeight.w900,),),
    );
  }
}
