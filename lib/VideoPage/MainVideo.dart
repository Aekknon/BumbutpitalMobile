import 'package:bumbutpital/VideoPage/VideoDetail.dart';
import 'package:flutter/material.dart';

class MainVideo extends StatelessWidget {
  @override
  Widget build(BuildContext contxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Page"),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text("Video Detail Page"),
            onPressed: () {
              Navigator.push(contxt,
                  MaterialPageRoute(builder: (context) => VideoDetail()));
            }),
      ),
    );
  }
}
