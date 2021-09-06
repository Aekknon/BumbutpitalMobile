import 'package:bumbutpital/Questionare/ShowResult.dart';
import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  @override
  Widget build(BuildContext contxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QuestionPage"),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text("ShowResultPage"),
            onPressed: () {
              Navigator.push(contxt,
                  MaterialPageRoute(builder: (context) => ShowResult()));
            }),
      ),
    );
  }
}
