import 'package:bumbutpital/HospitalPage/PromotionPage.dart';
import 'package:flutter/material.dart';

class HospitalDetail extends StatelessWidget {
  @override
  Widget build(BuildContext contxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hospital Detail"),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text("Promotion"),
            onPressed: () {
              Navigator.push(contxt,
                  MaterialPageRoute(builder: (context) => PromotionPage()));
            }),
      ),
    );
  }
}
