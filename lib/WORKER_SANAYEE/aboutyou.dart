import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class aboutyou extends StatefulWidget {
final name;
final phone;
final experience;
final info;
aboutyou({this.name,this.phone,this.experience,this.info});
  @override
  _aboutyouState createState() => _aboutyouState();
}

class _aboutyouState extends State<aboutyou> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 25,
      margin: EdgeInsets.only(right: 50, top: 10),
      child: Text('المعلومات الشخصية',
        style: TextStyle(
          color: Colors.white,
          fontSize: 13.3,
          fontFamily: 'Changa',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
