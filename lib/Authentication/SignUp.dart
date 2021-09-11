import 'package:bumbutpital/Questionare/MainQuestion.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext contxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Page"),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text("Go to Questionare"),
            onPressed: () {
              Navigator.push(contxt,
                  MaterialPageRoute(builder: (context) => MainQuestion()));
            }),
      ),
    );
  }
}
