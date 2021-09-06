import 'package:bumbutpital/MainPage.dart';
import 'package:flutter/material.dart';

class QRcodePage extends StatelessWidget {
  @override
  Widget build(BuildContext contxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Page"),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text("Go to MainPage"),
            onPressed: () {
              Navigator.push(
                  contxt, MaterialPageRoute(builder: (context) => MainPage()));
            }),
      ),
    );
  }
}
