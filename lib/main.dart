import 'package:flutter/material.dart';
import 'SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //use MaterialApp() widget like this
        home: SplashScreen() //create new widget class for this 'home' to
        // escape 'No MediaQuery widget found' error
        );
  }
}
