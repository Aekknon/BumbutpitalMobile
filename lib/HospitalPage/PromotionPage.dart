import 'package:bumbutpital/HospitalPage/KeepkoopongPage.dart';
import 'package:flutter/material.dart';

class PromotionPage extends StatelessWidget {
  @override
  Widget build(BuildContext contxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Promotion Page"),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text("KoopongPage"),
            onPressed: () {
              Navigator.push(contxt,
                  MaterialPageRoute(builder: (context) => KeepkoopongPage()));
            }),
      ),
    );
  }
}
