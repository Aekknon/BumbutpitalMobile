// ignore_for_file: avoid_print, file_names, use_key_in_widget_constructors

import 'package:bumbutpital/Authentication/Login.dart';
import 'package:bumbutpital/HospitalPage/current_koopong.dart';
import 'package:bumbutpital/services/graphql_config.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'edit_profile.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  static const query = """
                   query {
    getCurrentUser {
     id
       name
    surname
    email
    phoneNumber
    appropiatePHQSeverity
    appropiatePHQSeverityScore
    }
  }
                  """;

  static const query2 = """
                   query {
    getCurrentPromotion {
     

    }
  }
                  """;

  static const mutation = """
      
     mutation( \$appropiatePHQSeverity: String!){
  phq9permission(  appropiatePHQSeverity: \$appropiatePHQSeverity){
    successful
    message
  }
}
                        """;

  static const query1 = """
      
   query{
    getcurrentForum{
     title
    description
    answer
  }
}

                        """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFECF2FF),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff6367EA),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "My Profile",
            style: TextStyle(color: Colors.white),
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

            
            
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color((0xff6367EA)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                      ),
                      child: Row(
                        children: [
                          Spacer(),
                          Container(
                              
                              child: Column(
                                children: [
                                  Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        result.data!['getCurrentUser'][0]
                                                ['name'] +
                                            " " +
                                            result.data!['getCurrentUser'][0]
                                                ['surname'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditProfile()));
                                        },
                                        child: Icon(Icons.edit,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    result.data!['getCurrentUser'][0]['email'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  SizedBox(height: 30,),
                                  Spacer(),
                                ],
                              )),
                          Spacer(),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 5.0),
                            clipBehavior: Clip.antiAlias,
                            color: Colors.white,
                            elevation: 5.0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 22.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.help_rounded,
                                          color: Color(0xff6367EA),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "My Question",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      Query(
                                        options: QueryOptions(
                                            document: gql(query1),
                                            pollInterval: Duration(seconds: 1)),
                                        builder: (QueryResult result,
                                            {fetchMore, refetch}) {
                                          if (result.hasException) {
                                            return Text(
                                                result.exception.toString());
                                          }
                                          if (result.isLoading) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }

                                          if (result.data == null) {
                                            return Text(result.toString());
                                          }

                                          return Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: Color((0xff6367EA)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 2,
                                                      blurRadius: 5,
                                                      offset: Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8),
                                                    bottomRight:
                                                        Radius.circular(8),
                                                    topLeft: Radius.circular(8),
                                                    topRight:
                                                        Radius.circular(8),
                                                  )),
                                              child: Row(
                                                children: [
                                                  Spacer(),
                                                  Text(
                                                    result
                                                        .data![
                                                            'getcurrentForum']
                                                        .length
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 18.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                ],
                                              ));
                                        },
                                      ),
                                      SizedBox(
                                        width: 20,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.auto_stories,
                                          color: Color(0xff6367EA),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "My Diary",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Color((0xff6367EA)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(8),
                                                bottomRight: Radius.circular(8),
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8),
                                              )),
                                          child: Row(
                                            children: [
                                              Spacer(),
                                              Text(
                                                '10',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Spacer(),
                                            ],
                                          )),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      SizedBox(
                                        height: 60.0,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CurrentPromotionPage()));
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(10),
                                              child: Icon(
                                                Icons.card_giftcard_outlined,
                                                color: Color(0xff6367EA),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "My Promotion",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Spacer(),
                                            Query(
                                              options: QueryOptions(
                                                  document: gql(query2),
                                                  pollInterval:
                                                      Duration(seconds: 1)),
                                              builder: (QueryResult result2,
                                                  {fetchMore, refetch}) {
                                                if (result.hasException) {
                                                  return Text(result.exception
                                                      .toString());
                                                }
                                                if (result.isLoading) {
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                }

                                                if (result.data == null) {
                                                  return Text(
                                                      result.toString());
                                                }

                                                return Icon(
                                                  Icons.arrow_forward_rounded,
                                                 color:   Color((0xff6367EA))
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              width: 20.0,
                                            ),
                                          ],
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 1.0),
                              clipBehavior: Clip.antiAlias,
                              color: Colors.white,
                              elevation: 5.0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 0.0),
                                child: Row(
                                  children: [
                                    Spacer(),
                                    Container(
                                      transform:
                                          Matrix4.translationValues(0, 25, 0.0),
                                      height: 130,
                                      width: 130,
                                      child: SfRadialGauge(
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
                                                  sizeUnit:
                                                      GaugeSizeUnit.factor,
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
                                                  sizeUnit:
                                                      GaugeSizeUnit.factor,
                                                ),
                                                GaugeRange(
                                                  startValue: 10,
                                                  endValue: 15,
                                                  color: Color(0xffFFBC17),
                                                  // label: 'Fast',
                                                  labelStyle: GaugeTextStyle(
                                                      fontFamily: 'Times',
                                                      fontSize: 20),
                                                  sizeUnit:
                                                      GaugeSizeUnit.factor,
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
                                                  sizeUnit:
                                                      GaugeSizeUnit.factor,
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
                                                  sizeUnit:
                                                      GaugeSizeUnit.factor,
                                                  startWidth: 0.15,
                                                  endWidth: 0.15,
                                                ),
                                              ],
                                              pointers: <GaugePointer>[
                                                MarkerPointer(
                                                    value: double.parse(
                                                      result.data![
                                                              'getCurrentUser'][0]
                                                          [
                                                          'appropiatePHQSeverityScore'],
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
                                                    widget: Text(
                                                      result.data![
                                                              'getCurrentUser'][0]
                                                          [
                                                          'appropiatePHQSeverityScore'],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 26),
                                                    ))
                                              ])
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "My PHQ-9 Severity",
                                          style: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          result.data!['getCurrentUser'][0]
                                              ['appropiatePHQSeverity'],
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => ShowResult()));
                              await Provider.of<GraphQLConfiguration>(context,
                                      listen: false)
                                  .clearToken();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                  (route) => false);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Row(
                                children: [
                                  Spacer(),
                                  Icon(
                                    Icons.logout,
                                    color: Color(0xff6367EA),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "LOGOUT",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Color((0xff6367EA)),
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 100),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                primary: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
