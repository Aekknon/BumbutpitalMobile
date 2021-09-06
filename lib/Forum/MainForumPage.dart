import 'package:bumbutpital/Forum/AddQuestion.dart';
import 'package:flutter/material.dart';

class MainForumPage extends StatelessWidget {
  @override
  Widget build(BuildContext contxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forum Page"),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text("Add Question"),
            onPressed: () {
              Navigator.push(contxt,
                  MaterialPageRoute(builder: (context) => AddQuestion()));
            }),
      ),
    );
  }
}
