import 'package:flutter/material.dart';

class MOPHScreen extends StatelessWidget {
  @override
  Widget build(BuildContext contxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Page"),
      ),
      body: Center(
          child: ElevatedButton(
              child: Text("Go to Questionare"), onPressed: () {})),
    );
  }
}
