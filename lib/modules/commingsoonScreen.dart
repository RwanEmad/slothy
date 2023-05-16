import 'package:flutter/material.dart';
class commingsoonScreen extends StatefulWidget {
  const commingsoonScreen({Key? key}) : super(key: key);

  @override
  State<commingsoonScreen> createState() => _commingsoonScreenState();
}

class _commingsoonScreenState extends State<commingsoonScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("commingsoonScreen", style: TextStyle(
          color: Colors.cyan, fontSize: 40, fontWeight: FontWeight.w900,),),
      ),
    );
  }
}
