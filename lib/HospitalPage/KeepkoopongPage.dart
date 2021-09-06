import 'package:bumbutpital/HospitalPage/QRcodePage.dart';
import 'package:flutter/material.dart';

class KeepkoopongPage extends StatelessWidget {
  @override
  Widget build(BuildContext contxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Koopong Page"),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text("QR Code"),
            onPressed: () {
              Navigator.push(contxt,
                  MaterialPageRoute(builder: (context) => QRcodePage()));
            }),
      ),
    );
  }
}
