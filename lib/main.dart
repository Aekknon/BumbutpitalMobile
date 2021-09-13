import 'package:flutter/material.dart';
import 'Questionare/ShowResult.dart';
import 'SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //use MaterialApp() widget like this
        home: SplashScreen(), //create new widget class for this 'home' to
        routes: {
          ShowResult.routeName: (_) => ShowResult(),
        }
        // escape 'No MediaQuery widget found' error
        );
  }
}
