// ignore_for_file: use_key_in_widget_constructors

import 'package:bumbutpital/ComponentMainScreen/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import "dart:math";

class ShowResult extends StatelessWidget {
  static const routeName = "/question/result";
  @override

  // ignore: override_on_non_overriding_member
  String getPhq9Type(int PHQ9result) {
    var _phq9Type = "";
    if (PHQ9result >= 0 && PHQ9result <= 4) {
      _phq9Type = 'Minimal Depression';
    } else if (PHQ9result > 4 && PHQ9result <= 9) {
      _phq9Type = 'Mild Depression';
    } else if (PHQ9result > 9 && PHQ9result <= 14) {
      _phq9Type = 'Moderate Depression';
    } else if (PHQ9result > 14 && PHQ9result <= 19) {
      _phq9Type = 'Moderately severe Depression';
    } else if (PHQ9result > 19 && PHQ9result <= 27) {
      _phq9Type = 'Severe Depression';
    }
    return _phq9Type;
  }

  static const addPHQ9Score = """
      
     mutation(\$phq9: String! , \$phq9score: String! , \$appropiatePHQSeverityLog: String! ,  \$appropiatePHQSeverityScoreLog: String! ){
  addPHQScore( appropiatePHQSeverity:\$phq9 ,appropiatePHQSeverityScore: \$phq9score , appropiatePHQSeverityLog: \$appropiatePHQSeverityLog,  appropiatePHQSeverityScoreLog: \$appropiatePHQSeverityScoreLog ){
    appropiatePHQSeverity
    appropiatePHQSeverityScore
    appropiatePHQSeverityLog
    appropiatePHQSeverityScoreLog
  }
}
                        """;

  static const query = """
                   query {
    getCurrentUser {
     
       name
    surname
    email
    phoneNumber
    appropiatePHQSeverity
    appropiatePHQSeverityScore


    }
  }
                  """;

  @override
  Widget build(BuildContext context) {
    final PHQ9result = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
        backgroundColor: Color(0XFFECF2FF),
        body: Query(
          options: QueryOptions(document: gql(query)),
          builder: (QueryResult result, {fetchMore, refetch}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }
            if (result.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (result.data == null) {
              return Text(result.toString());
            }
            bool visibleFirstTime = true;
            String LastPHQ9Score = '';
            if (result.data!['getCurrentUser'][0]
                        ['appropiatePHQSeverityScore'] ==
                    null ||
                result.data!['getCurrentUser'][0]
                        ['appropiatePHQSeverityScore'] ==
                    "") {
              LastPHQ9Score = "0";
              visibleFirstTime = false;
              print("======================");
            } else {
              LastPHQ9Score = result.data!['getCurrentUser'][0]
                  ['appropiatePHQSeverityScore'];
              visibleFirstTime = true;
            }
            final Phq9Score =
                result.data!['getCurrentUser'][0]['phq9permission'];
            Future<void> onSubmit(RunMutation run) async {
              try {
                final response = run({
                  "phq9": getPhq9Type(PHQ9result),
                  "phq9score": PHQ9result.toString(),
                  "appropiatePHQSeverityLog": getPhq9Type(PHQ9result),
                  "appropiatePHQSeverityScoreLog": PHQ9result.toString(),
                });
                print((await response.networkResult) as dynamic);

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNavBar()),
                    (route) => false);
              } catch (err) {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Error!'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: const <Widget>[
                            Text('Insert your Question'),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }

            var listDecrease = [
              'You are great. We hope you are in better mental health.',
              'Are you in a better mood? You will be in a better mood tomorrow.',
              'Very good. We hope that we are one of the things that make you feel better.',
              'Today must be a good day. Have a good day',
              'May every day be a better day than today'
            ];
            var listIncrease = [
              'Are you tired? It is okay. Tomorrow will be better.',
              'It is okay, even if your symptoms are not getting better. But let \'s try together.',
              'It is okay if you still do not understand anything. Let \'s find our story and read it.',
              'Are you tired? It is okay, we will help you. The next round must be better for sure.',
              'Do not stop trying There is always hope for tomorrow.'
            ];
            var listSame = [
              'Until now the score will be the same. But the next round must be better.',
              'not getting better But it is not worse.',
              'good effort do not stop trying',
            ];

            final _random = new Random();
            var LastsocreInt = int.parse(LastPHQ9Score);
            String TextScore = '';
            var TextHope = "";
            if (LastsocreInt < PHQ9result && LastsocreInt != 0) {
              TextScore = "Your appropiatePHQSeverityScore is increase from";
              TextHope = listIncrease[_random.nextInt(listIncrease.length)];
            } else if (LastsocreInt > PHQ9result && LastsocreInt != 0) {
              TextScore = "Your appropiatePHQSeverityScore is decrease from";
              TextHope = listDecrease[_random.nextInt(listDecrease.length)];
            } else if (LastsocreInt == 0) {
              TextScore = "It is your first time, It look Grate";
              TextHope = "";
            } else {
              TextScore = "Your appropiatePHQSeverityScore is the same";
              TextHope = listSame[_random.nextInt(listSame.length)];
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'YOUR PHQ-9 SCORE',
                    style: GoogleFonts.karla(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                          showLabels: false,
                          showAxisLine: false,
                          showTicks: false,
                          minimum: 0,
                          maximum: 27,
                          startAngle: 180,
                          endAngle: 0,
                          ranges: <GaugeRange>[
                            GaugeRange(
                              startValue: 0,
                              endValue: 5,
                              color: Color(0xff20CBFE),
                              // label: 'Slow',
                              sizeUnit: GaugeSizeUnit.factor,
                              labelStyle: GaugeTextStyle(
                                  fontFamily: 'Times', fontSize: 20),
                              startWidth: 0.15,
                              endWidth: 0.15,
                            ),
                            GaugeRange(
                              startValue: 5,
                              endValue: 10,
                              color: Color(0xff32D475),
                              // label: 'Moderate',
                              labelStyle: GaugeTextStyle(
                                  fontFamily: 'Times', fontSize: 20),
                              startWidth: 0.15,
                              endWidth: 0.15,
                              sizeUnit: GaugeSizeUnit.factor,
                            ),
                            GaugeRange(
                              startValue: 10,
                              endValue: 15,
                              color: Color(0xffFFBC17),
                              // label: 'Fast',
                              labelStyle: GaugeTextStyle(
                                  fontFamily: 'Times', fontSize: 20),
                              sizeUnit: GaugeSizeUnit.factor,
                              startWidth: 0.15,
                              endWidth: 0.15,
                            ),
                            GaugeRange(
                              startValue: 15,
                              endValue: 20,
                              color: Color(0xffE76849),
                              // label: 'Fast',
                              labelStyle: GaugeTextStyle(
                                  fontFamily: 'Times', fontSize: 20),
                              sizeUnit: GaugeSizeUnit.factor,
                              startWidth: 0.15,
                              endWidth: 0.15,
                            ),
                            GaugeRange(
                              startValue: 20,
                              endValue: 27,
                              color: Color(0xffF14949),
                              // label: 'Fast',
                              labelStyle: GaugeTextStyle(
                                  fontFamily: 'Times', fontSize: 20),
                              sizeUnit: GaugeSizeUnit.factor,
                              startWidth: 0.15,
                              endWidth: 0.15,
                            ),
                          ],
                          pointers: <GaugePointer>[
                            MarkerPointer(
                                value: double.parse(PHQ9result.toString()),
                                enableDragging: true,
                                markerWidth: 30,
                                markerHeight: 30,
                                markerOffset: 50,
                                overlayColor: Colors.red.withOpacity(0.12),
                                markerType: MarkerType.triangle)
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                                angle: 90,
                                positionFactor: 0,
                                widget: Container(
                                  transform:
                                      Matrix4.translationValues(0, 200, 0.0),
                                  child: Column(
                                    children: [
                                      Text(TextScore),
                                      Row(
                                        children: [
                                          Spacer(),
                                          Visibility(
                                            visible: visibleFirstTime,
                                            child: Text(
                                              LastPHQ9Score,
                                              style: GoogleFonts.karla(
                                                  fontSize: 40),
                                            ),
                                          ),
                                          Visibility(
                                            visible: visibleFirstTime,
                                            child: SizedBox(width: 20),
                                          ),
                                          Visibility(
                                            visible: visibleFirstTime,
                                            child: Icon(
                                                Icons.arrow_forward_rounded),
                                          ),
                                          Visibility(
                                            visible: visibleFirstTime,
                                            child: SizedBox(width: 20),
                                          ),
                                          Text(
                                            '$PHQ9result',
                                            style:
                                                GoogleFonts.karla(fontSize: 40),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ))
                          ])
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'You are ${getPhq9Type(PHQ9result)}.',
                        style: GoogleFonts.karla(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(TextHope),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Mutation(
                    options: MutationOptions(document: gql(addPHQ9Score)),
                    builder: (run, _) => ElevatedButton(
                      onPressed: () async {
                        await onSubmit(run);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color((0xff6367EA)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      ),
                      child: Text("SUBMIT SCORE"),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
