import 'package:bumbutpital/Questionare/QuestionScreen.dart';
import 'package:flutter/material.dart';

class MainQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext contxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ask for Question"),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text("Questionare"),
            onPressed: () {
              Navigator.push(
                  contxt, MaterialPageRoute(builder: (context) => Question()));
            }),
      ),
    );
  }
}
