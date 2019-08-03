import 'package:flutter/material.dart';
import 'package:mariealert/screens/register.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Explicit
  String appName = 'Maria Care';
  double mySizeLogo = 130.0, mySizeButton = 180.0;
  Color fontColor = Colors.blue[800];

  // Method

  Widget showLogo() {
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        width: mySizeLogo,
        height: mySizeLogo,
        child: Image.asset('images/logo1.png'),
      ),
    );
  }

  Widget showAppName() {
    return Text(
      appName,
      style: TextStyle(
        fontSize: 35.0,
        color: fontColor,
        fontWeight: FontWeight.normal,
        fontFamily: 'Lobster',
      ),
    );
  }

  Widget mySizeBox() {
    return SizedBox(
      height: 16.0,
    );
  }

  Widget signInButton() {
    return Container(
      width: mySizeButton,
      child: FlatButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.blue[600],
        child: Text(
          'ลงชื่อเข้าใช้งาน',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget signUpButton() {
    return Container(
      width: mySizeButton,
      child: OutlineButton(
        borderSide: BorderSide(
          color: Colors.blue[700],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'สมัครสมาชิก',
          style: TextStyle(color: fontColor),
        ),
        onPressed: () {
          var registerRoute =
              MaterialPageRoute(builder: (BuildContext context) => Register());
              Navigator.of(context).push(registerRoute);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
          colors: [
            Colors.white,
            Colors.blue[900],
          ],
          radius: 1.5,
          center: Alignment.center,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showLogo(),
            mySizeBox(),
            showAppName(),
            signInButton(),
            signUpButton(),
          ],
        ),
      ),
    );
  }
}
