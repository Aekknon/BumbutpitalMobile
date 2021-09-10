import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF979797)),
          borderRadius: BorderRadius.circular(15),
          color: Color(0XFFECF2FF)),
      child: Row(
        children: [
          Container(
            height: 26,
            width: 26,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Color(0xFF979797))),
          ),
          Container(
            width: 20,
          ),
          Text(
            "1. Test",
            style: TextStyle(color: Color(0xFF979797)),
          ),
        ],
      ),
    );
  }
}
