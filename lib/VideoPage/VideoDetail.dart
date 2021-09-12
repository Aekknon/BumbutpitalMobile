// import 'package:bumbutpital/MainPage.dart';
// import 'package:bumbutpital/VideoPage/MainVideo.dart';
import 'package:bumbutpital/ComponentMainScreen/bottomnavbar.dart';
import 'package:flutter/material.dart';

class VideoDetail extends StatelessWidget {
  @override
  Widget build(BuildContext contxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VideoDetail"),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text("MainPage"),
            onPressed: () {
              Navigator.push(
                  contxt, MaterialPageRoute(builder: (context) => BottomNavBar()));
            }),
      ),
    );
  }
}
