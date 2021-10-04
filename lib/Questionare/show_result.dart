
// ignore_for_file: use_key_in_widget_constructors

import 'package:bumbutpital/ComponentMainScreen/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ShowResult extends StatelessWidget {
  static const routeName = "/question/result";
  @override

  // ignore: override_on_non_overriding_member
  String getPhq9Type(int result) {
    var _phq9Type = "";
    if (result >= 0 && result <= 4) {
      _phq9Type = 'Minimal Depression';
    } else if (result > 4 && result <= 9) {
      _phq9Type = 'Mild Depression';
    } else if (result > 9 && result <= 14) {
      _phq9Type = 'Moderate Depression';
    } else if (result > 14 && result <= 19) {
      _phq9Type = 'Moderately severe Depression';
    } else if (result > 19 && result <= 27) {
      _phq9Type = 'Severe Depression';
    }
    return _phq9Type;
  }
 
 static const addPHQ9Score = """
      
     mutation(\$phq9: String! ){
  addPHQScore( appropiatePHQSeverity:\$phq9){
    successful
    message
  }
}
                        """;


  @override
  Widget build(BuildContext context) {
    final result = ModalRoute.of(context)!.settings.arguments as int;
    Future<void> onSubmit(RunMutation run) async {
  
    if (getPhq9Type(result).isEmpty) return;
    try {
      final response = run({
        "phq9": getPhq9Type(result),
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
    return Scaffold(
      body: Container(
        color: Color(0XFFECF2FF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'YOUR PHQ-9 SCORE',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
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
                                value: double.parse(result.toString()),
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
                                widget: Text(
                                  '$result',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                ))
                          ])
                    ],
                  ),
                Text(
                    'You are ${getPhq9Type(result)}.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BottomNavBar()));
              },
              child:  Mutation(
                                  options:
                                      MutationOptions(document: gql(addPHQ9Score)),
                                  builder: (run, _) => ElevatedButton(
                                    onPressed: () async {
                                      await onSubmit(run);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0XFFFE7940),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 100, vertical: 15),
                                    ),
                                    child: Text("SUBMIT QUESTION"),
                                  ),
                                )
            )],
        ),
      ),
    );
  }
}
