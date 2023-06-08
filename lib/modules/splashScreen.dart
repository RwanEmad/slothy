import 'package:flutter/material.dart';
import 'package:slothy/modules/welcomeScreen.dart';
class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _navigatetohome();
  // }
  //
  // _navigatetohome() async {
  //   await Future.delayed(Duration(milliseconds: 1500), () {});
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => welcomeScreen()));
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.cyan,
      body: Center(
        child: Text("Slothy", style: TextStyle(
          color: Colors.white, fontSize: 40, fontWeight: FontWeight.w900,),),
      ),
    );
  }
}

