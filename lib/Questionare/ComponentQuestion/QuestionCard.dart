import 'package:bumbutpital/models/Questions.dart';
import 'package:flutter/material.dart';
import 'ButtonInCard.dart';
import 'Option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Text(
            sample_data[0]['question'],
            style: TextStyle(fontSize: 16),
          ),
          Option(),
          Option(),
          Option(),
          Option(),
          Container(
            height: 20,
          ),
          ButtonInCard(),
          Container(
            height: 20,
          ),
        ],
      ),
    );
  }
}
