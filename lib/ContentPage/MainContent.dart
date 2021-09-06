import 'package:flutter/material.dart';
import 'package:bumbutpital/ContentPage/ContentDetail.dart';

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext contxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Content"),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text("ContentPageDetail"),
            onPressed: () {
              Navigator.push(contxt,
                  MaterialPageRoute(builder: (context) => ContentDetail()));
            }),
      ),
    );
  }
}
