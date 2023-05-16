import 'package:flutter/material.dart';

import '../models/models.dart';
import '../shared/components/component.dart';
import '../shared/style/colors.dart';
class profileScreen extends StatefulWidget {
  const profileScreen({Key? key}) : super(key: key);

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Text("Profile Screen", style: TextStyle(
          color: Colors.white, fontSize: 40, fontWeight: FontWeight.w900,),),
      ),
    );
  }
}
