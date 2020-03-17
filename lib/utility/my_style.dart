import 'package:flutter/material.dart';

class MyStyle {

  Color textColors = Color.fromARGB(0xff, 0x00, 0x08, 0xae);
  Color mainColors = Color.fromARGB(0xff, 0x0a, 0x32, 0xe1);

  TextStyle h1Style = TextStyle(
        fontSize: 30.0,
        color: Color.fromARGB(0xff, 0x00, 0x08, 0xae),
        fontWeight: FontWeight.normal,
        fontFamily: 'Lobster',
      );

      TextStyle h2Style = TextStyle(
        fontSize: 18.0,
        color: Color.fromARGB(0xff, 0x00, 0x08, 0xae),
        fontWeight: FontWeight.normal,
        fontFamily: 'Lobster',
      );

  Widget showLogo = Container(
      alignment: Alignment.topCenter,
      child: Container(
        width: 130.0,
        height: 130.0,
        child: Image.asset('images/logo1.png'),
      ),
    );
      

  MyStyle();
  
}