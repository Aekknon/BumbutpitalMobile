import 'package:bumbutpital/ComponentMainScreen/bottomnavbar.dart';
import 'package:flutter/material.dart';

class ShowResult extends StatelessWidget {
  static const routeName = "/question/result";
  @override
  Widget build(BuildContext context) {
    final result = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("$result"),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text('$result'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BottomNavBar()));
            }),
      ),
    );
  }
}
