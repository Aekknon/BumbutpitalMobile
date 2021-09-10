import 'package:bumbutpital/Questionare/QuestionScreen.dart';
import 'package:flutter/material.dart';

class MainQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Main Question",
        home: Scaffold(
            backgroundColor: Color(0XFFECF2FF),
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Center(
                  child: Column(children: [
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Image.asset('asset/image/Bumbutpital Logo.png'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('BUMBUTPITAL',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  child: Text(
                    'Welcome to BUMBUTPITAL',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  child: Text(
                    "Let's check your depression",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                Container(
                  child: Image.asset('asset/image/MainQuestionPic.png'),
                ),
                SizedBox(
                  height: 21,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Question()));
                  },
                  style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                      ),
                      primary: Color(0XFFFE7940),
                      fixedSize: Size(350, 50)),
                  child: Text("GET STARTED"),
                ),
              ])),
            )))));
  }
}
