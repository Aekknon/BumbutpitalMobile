import 'package:flutter/material.dart';
import 'Authentication/Login.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to LoginPage"),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      //MediaQuery methods in use
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
    ));
  }
}
