import 'package:bumbutpital/Main_Screen.dart';

import 'package:flutter/material.dart';

class AllQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext contxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AllQuestion"),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text("Go to MainPage"),
            onPressed: () {
              Navigator.push(contxt,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            }),
      ),
    );
  }
}
