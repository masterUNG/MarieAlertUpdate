import 'package:flutter/material.dart';
import 'package:mariealert/screens/authen.dart';
import 'package:mariealert/screens/register.dart';
import 'package:mariealert/screens/show_news_list.dart';
import 'package:mariealert/utility/my_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Explicit
  String appName = 'Maria Care';
  double mySizeLogo = 130.0, mySizeButton = 180.0;
  Color fontColor = Colors.blue[800];
  bool status = false;

  // Method
  @override
  void initState() {
    super.initState();
    
  }

  

  Widget showProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

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
      style: MyStyle().h1Style,
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
        color: MyStyle().textColors,
        child: Text(
          'ลงชื่อเข้าใช้งาน',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          var authenRoute =
              MaterialPageRoute(builder: (BuildContext context) => Authen());
          Navigator.of(context).push(authenRoute);
        },
      ),
    );
  }

  Widget signUpButton() {
    return Container(
      width: mySizeButton,
      child: RaisedButton(color: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'สมัครสมาชิก',
          style: TextStyle(color: MyStyle().textColors),
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
      // body: status ? showContent() : showProgress(),
      body: showContent(),
    );
  }

  Container showContent() {
    return Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(
        colors: [
          Colors.white,
          MyStyle().mainColors,
        ],
        radius: 1.0,
        center: Alignment(0.0, -0.3),
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
    );
  }
}
