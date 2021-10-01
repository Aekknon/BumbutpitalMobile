import 'package:bumbutpital/services/graphql_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Authentication/login.dart';

class SplashScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()  {
    super.initState();
    _tryLogin();
    _navigatetohome();
  }

  _tryLogin() async {
    await Provider.of<GraphQLConfiguration>(context, listen: false)
        .fetchToken();
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
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('asset/image/Bumbutpital Logo.png'))),
          ),
          SizedBox(height: 20),
          Text(
            'BUMBUTPITAL',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }
}
