import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AllGraph extends StatefulWidget {
  AllGraph({Key? key}) : super(key: key);

  @override
  _AllGraphState createState() => _AllGraphState();
}

class _AllGraphState extends State<AllGraph> {
  static const query = """
                   query {
    getPHQ9Log {
      appropiatePHQSeverityLog
       appropiatePHQSeverityScoreLog
    date
    }
  }
                  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff6367EA),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "My PHQ-9 Score",
            style: GoogleFonts.karla(color: Colors.white),
          ),
        ),
      body: Query(
      options: QueryOptions(
          document: gql(query), pollInterval: Duration(seconds: 1)),
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
        final content = result.data!['getPHQ9Log'];
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0XFFECF2FF),
          child: Column(
            children: [
              SizedBox(height: 15,),
              Expanded(
                  child: Scrollbar(
                      isAlwaysShown: true,
                      showTrackOnHover: true,
                      radius: Radius.circular(10),
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          int reverseIndex =
                              result.data!['getPHQ9Log'].length - 1 - index;
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: Column(
                                  children: [
                                    SizedBox(height: 15,),
                                    Text(
                                      result.data!['getPHQ9Log'][reverseIndex]
                                              ['date']
                                          .substring(0, 24),
                                      style: GoogleFonts.karla(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 15,),
                                    Container(
                                      width: MediaQuery.of(context).size.width*0.8,
                                      height: MediaQuery.of(context).size.width*0.54,
                                      child: 
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
                                                    fontFamily: 'Times',
                                                    fontSize: 20),
                                                startWidth: 0.15,
                                                endWidth: 0.15,
                                              ),
                                              GaugeRange(
                                                startValue: 5,
                                                endValue: 10,
                                                color: Color(0xff32D475),
                                                // label: 'Moderate',
                                                labelStyle: GaugeTextStyle(
                                                    fontFamily: 'Times',
                                                    fontSize: 20),
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
                                                    fontFamily: 'Times',
                                                    fontSize: 20),
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
                                                    fontFamily: 'Times',
                                                    fontSize: 20),
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
                                                    fontFamily: 'Times',
                                                    fontSize: 20),
                                                sizeUnit: GaugeSizeUnit.factor,
                                                startWidth: 0.15,
                                                endWidth: 0.15,
                                              ),
                                            ],
                                            pointers: <GaugePointer>[
                                              MarkerPointer(
                                                  value: double.parse(
                                                    result.data!['getPHQ9Log']
                                                            [reverseIndex][
                                                        'appropiatePHQSeverityScoreLog'],
                                                  ),
                                                  enableDragging: true,
                                                  markerWidth: 20,
                                                  markerHeight: 20,
                                                  markerOffset: 30,
                                                  overlayColor: Colors.red
                                                      .withOpacity(0.12),
                                                  markerType:
                                                      MarkerType.triangle)
                                            ],
                                            annotations: <GaugeAnnotation>[
                                              GaugeAnnotation(
                                                  angle: 90,
                                                  positionFactor: 0,
                                                  widget: Container(
                                                     transform: Matrix4.translationValues(0, 100, 0.0),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          result.data![
                                                                      'getPHQ9Log']
                                                                  [reverseIndex]
                                                              [
                                                              'appropiatePHQSeverityScoreLog'],
                                                          style:
                                                              GoogleFonts.karla(
                                                            fontSize: 24.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        Text(
                                                          result.data![
                                                                      'getPHQ9Log']
                                                                  [reverseIndex]
                                                              [
                                                              'appropiatePHQSeverityLog'],
                                                          style:
                                                              GoogleFonts.karla(
                                                            fontSize: 16.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ))
                                            ])
                                      ],
                                    ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,)
                            ],
                          );
                        },
                        itemCount: result.data!['getPHQ9Log'].length,
                      ))),
            ],
          ),
        );
      },
    ),
    );
  }
}
