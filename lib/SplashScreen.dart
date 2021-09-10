import 'package:flutter/material.dart';
import 'Authentication/Login.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFECF2FF),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.pink,
          ),
          SizedBox(height: 20),
          Container(
              child: Text(
            'BUMBUTPITAL',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )),
        ]),
      ),
    );
  }
}
