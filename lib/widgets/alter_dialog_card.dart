import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class alterDialod_card extends StatelessWidget {
  const alterDialod_card({Key? key}) : super(key: key);
   final keyIsFirstLoaded = 'is_first_loaded';


  @override
  Widget build(BuildContext context) {
     Future.delayed(Duration(seconds: 5), () => showDialogIfFirstLoaded(context));
    return Container();
  }
  showDialogIfFirstLoaded(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
    if (isFirstLoaded == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title:  Text("Title"),
            content:  Text("This is one time dialog"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
               ElevatedButton(
                child: Text("Dismiss"),
                onPressed: () {
                  // Close the dialog
                  Navigator.of(context).pop();
                  prefs.setBool(keyIsFirstLoaded, false);
                },
              ),
            ],
          );
        },
      );
    }
  }
}