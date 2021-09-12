import 'package:flutter/material.dart';
import 'package:bumbutpital/Diary/MainDiary.dart';

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
              Navigator.push(
                  contxt, MaterialPageRoute(builder: (context) => MainDiary()));
            }),
      ),
    );
  }
}
