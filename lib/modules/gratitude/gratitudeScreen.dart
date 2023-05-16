import 'package:flutter/material.dart';
class gratitudeScreen extends StatefulWidget {
  const gratitudeScreen({Key? key}) : super(key: key);

  @override
  State<gratitudeScreen> createState() => _gratitudeScreenState();
}

class _gratitudeScreenState extends State<gratitudeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("gratitudeScreen", style: TextStyle(
          color: Colors.cyan, fontSize: 40, fontWeight: FontWeight.w900,),),
      ),
    );
  }
}
