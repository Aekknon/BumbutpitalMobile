import 'package:flutter/material.dart';

import 'DiaryDetail.dart';

class WriteDiary extends StatelessWidget {
  @override
  Widget build(BuildContext contxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MainDiary"),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text("MainPage"),
            onPressed: () {
              Navigator.push(contxt,
                  MaterialPageRoute(builder: (context) => DiaryDetail()));
            }),
      ),
    );
  }
}
