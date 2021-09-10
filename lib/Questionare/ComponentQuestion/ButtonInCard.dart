import 'package:bumbutpital/mainPage.dart';
import 'package:flutter/material.dart';

import '../QuestionScreen.dart';

class ButtonInCard extends StatelessWidget {
  const ButtonInCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainPage()));
        },
        style: ElevatedButton.styleFrom(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(8.0),
            ),
            primary: Color(0XFFFE7940),
            fixedSize: Size(60, 36)),
        child: Text("Next"),
      ),
    );
  }
}
