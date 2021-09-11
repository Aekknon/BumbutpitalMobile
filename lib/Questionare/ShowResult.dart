import 'package:bumbutpital/MainPage.dart';
import 'package:flutter/material.dart';

class ShowResult extends StatelessWidget {
  @override
  Widget build(BuildContext contxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Result Page"),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text("MainPage"),
            onPressed: () {
              Navigator.push(
                  contxt, MaterialPageRoute(builder: (context) => MainPage()));
            }),
      ),
    );
  }
}
