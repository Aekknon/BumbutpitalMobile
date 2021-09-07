import 'package:flutter/material.dart';
import 'Authentication/Login.dart';

class SplashScreen extends StatelessWidget {
  get backgroundColor => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash"),
      ),
      backgroundColor: Color(0XFFECF2FF),
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

class Updated {}

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
// int hexColor(String color) {
//   String newColor = '0xff' + color;

//   newColor = newColor.replaceAll('#', '');
//   int finalColor = int.parse(newColor);
//   return finalColor;
// }

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       //MediaQuery methods in use
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height * 0.4,
//     ));
//   }
// }
