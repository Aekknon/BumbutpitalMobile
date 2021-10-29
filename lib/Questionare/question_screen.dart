// import 'package:websafe_svg/websafe_svg.dart';
// import 'package:bumbutpital/models/Questions.dart';
import 'package:bumbutpital/models/questions.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'ComponentQuestion/question_card.dart';
import 'show_result.dart';

class Question extends StatefulWidget {
  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int _currentPage = 1;
  List<int> _answerList = List.filled(9, -1);

  int _currentAnswer = -1;

  void onClickNextPage() {
    setState(() {
      _answerList[_currentPage - 1] = _currentAnswer;
      if (_currentAnswer == -1) {
        return;
      }
      if (_currentPage == 9) {
        Navigator.of(context).pushNamed(ShowResult.routeName,
            arguments: _answerList.reduce((a, b) => a + b));
        print(_answerList);
      }
      _currentAnswer = _answerList[_currentPage];
      _currentPage++;
    });

    // print(_answerList);
  }

  void onClickPrevPage() {
    setState(() {
      if (_currentAnswer != -1) {
        _answerList[_currentPage - 1] = _currentAnswer;
      }
      _currentAnswer = _answerList[_currentPage - 2];
      _currentPage--;
    });

    // print(_answerList);
  }

  void onSelectAnswer(int index) {
    setState(() {
      _currentAnswer = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFECF2FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                LinearPercentIndicator(
                  lineHeight: 14.0,
                  percent: _currentPage / 9,
                  backgroundColor: Colors.grey,
                  progressColor:Color((0xff6367EA)),
                ),
                Container(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                    text: "Question ${_currentPage}",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Color(0xFF979797),
                        ),
                    children: [
                      TextSpan(
                          text: "/9",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Color(0xFF979797)))
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                QuestionCard(
                  question: questionsList[_currentPage - 1],
                  onNext: onClickNextPage,
                  onPrev: onClickPrevPage,
                  size: questionsList.length,
                  onSelect: onSelectAnswer,
                  currentAnswer: _currentAnswer,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
