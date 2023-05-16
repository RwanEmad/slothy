import 'package:flutter/material.dart';
class goalsScreen extends StatefulWidget {
  const goalsScreen({Key? key}) : super(key: key);

  @override
  State<goalsScreen> createState() => _goalsScreenState();
}

class _goalsScreenState extends State<goalsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("goalsScreen", style: TextStyle(
          color: Colors.cyan, fontSize: 40, fontWeight: FontWeight.w900,),),
      ),
    );
  }
}
