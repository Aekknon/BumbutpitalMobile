import 'package:bumbutpital/HospitalPage/HospitalDetail.dart';
import 'package:flutter/material.dart';

class MainHospital extends StatelessWidget {
  @override
  Widget build(BuildContext contxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hospital Page"),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text("HospitalDetail"),
            onPressed: () {
              Navigator.push(contxt,
                  MaterialPageRoute(builder: (context) => HospitalDetail()));
            }),
      ),
    );
  }
}
