import 'package:flutter/material.dart';

class DiaryDetail extends StatelessWidget {
  @override
  Widget build(BuildContext contxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Content"),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text("MainPage"),
            onPressed: () {
              // Navigator.push(
              //     contxt, MaterialPageRoute(builder: (context) => MainDiary()));
            }),
      ),
    );
  }
}
