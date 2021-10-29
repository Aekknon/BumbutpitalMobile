import 'package:bumbutpital/models/questions.dart';
import 'package:flutter/material.dart';
import 'button_in_card.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final void Function() onNext;
  final void Function() onPrev;
  final void Function(int) onSelect;
  final int size;
  final int currentAnswer;

  const QuestionCard({
    Key? key,
    required this.question,
    required this.onNext,
    required this.onPrev,
    required this.size,
    required this.onSelect,
    required this.currentAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Q${question.id}. ${question.title}?',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          ...List.generate(options.length, (index) {
            return Option(
                option: options[index],
                onSelect: onSelect,
                isSelected: index == currentAnswer);
          }),
          SizedBox(
            height: 32,
          ),
          CardBarButton(
            onNext: onNext,
            onPrev: onPrev,
            havePrev: question.id != 1,
            haveNext: question.id != size,
          ),
        ],
      ),
    );
  }
}
