import 'package:bumbutpital/Forum/AllQuestion.dart';
import 'package:flutter/material.dart';

class AddQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext contxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Question Page"),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text("All Question"),
            onPressed: () {
              Navigator.push(contxt,
                  MaterialPageRoute(builder: (context) => AllQuestion()));
            }),
      ),
    );
  }
}
