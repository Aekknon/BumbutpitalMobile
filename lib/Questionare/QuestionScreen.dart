// import 'package:websafe_svg/websafe_svg.dart';
// import 'package:bumbutpital/models/Questions.dart';
import 'package:flutter/material.dart';

import 'ComponentQuestion/QuestionCard.dart';

class Question extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Main Question",
        home: Scaffold(
            backgroundColor: Color(0XFFECF2FF),
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: SizedBox(
                                  height: 50,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 15,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0XFFBFBFBF)),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Stack(
                                  children: [
                                    LayoutBuilder(
                                        builder: (context, constraints) =>
                                            Container(
                                              width: constraints.maxWidth * 0.2,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xFFFE7940),
                                                        Color(0xFFFF8A00)
                                                      ]),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ))
                                  ],
                                ),
                              ),
                              Container(
                                height: 10,
                              ),
                              Text.rich(TextSpan(
                                  text: "Question 1",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: Color(0xFF979797),
                                      ),
                                  children: [
                                    TextSpan(
                                        text: "/9",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(color: Color(0xFF979797)))
                                  ])),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                  child: PageView.builder(
                                      itemBuilder: (context, index) =>
                                          QuestionCard()))
                            ],
                          ),
                        ))))));
  }
}
