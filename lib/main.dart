import 'dart:async';

import 'package:flutter/material.dart';
import 'package:warungtendasteak/ui/homepage.dart';

void main() {
  runApp(MyWTS());
}

class MyWTS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override                         
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }
  
  startTime() async {
    var duration = new Duration(seconds: 6);
    return new Timer(duration, route);
  }
  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => HomePage()
      )
    ); 
  }
  
  initScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Container(
            //   child: Image.asset("images/logo.png"),
            // ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              "Splash Screen",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
           )
         ],
       ),
      ),
    );
  }
}