import 'package:bumbutpital/widgets/content_card.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// ignore: use_key_in_widget_constructors
class MainContent extends StatefulWidget {
  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  int _currentTabs = 0;
  String selected = "1";
  String select1 = "1";
  bool visible = true;

  final tabs = [
    ContentCard(),
    ContentCard1(),
    ContentCard2(),
    ContentCard3(),
    ContentCard4(),
    ContentCard5()
  ];

  void _onChangeTab(int index) {
    setState(() {
      _currentTabs = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: Color((0xff6367EA)),
          elevation: 0,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color((0XFFECF2FF)),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  color: Color((0xff6367EA)),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: Center(
                    child: Column(
                  children: [
                    Expanded(
                      child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 30.0),
                            child: Text(
                              'CONTENT',
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  decoration: TextDecoration.none),
                            ),
                          )),
                    ),
                  ],
                )),
              ),
              Row(
                children: [
                  Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected = '1';
                        visible = true;
                      });
                    },
                    child: Container(
                      transform: Matrix4.translationValues(0, -25, 0.0),
                      height: 75,
                      width: 75,
                      child: Column(
                        children: [
                          Icon(
                            Icons.visibility,
                            size: 50,
                            color: selected == '1' ? Colors.white : Colors.grey,
                          ),
                          Text('see all',style: TextStyle(color: selected == '1' ? Colors.white : Colors.black,),),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: selected == '1'
                              ? Color(0XFFFE7940)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _currentTabs = 5;
                        selected = '2';
                        visible = false;
                      });
                    },
                    child: Container(
                      transform: Matrix4.translationValues(0, -25, 0.0),
                      height: 75,
                      width: 75,
                      child: Column(
                        children: [
                          Icon(
                            Icons.add,
                            size: 50,
                            color: selected == '2' ? Colors.white : Colors.grey,
                          ),
                          Text('Recommen',style: TextStyle(color: selected == '2' ? Colors.white : Colors.black,),)
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: selected == '2'
                              ? Color(0XFFFE7940)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  SizedBox(),
                  Spacer(),
                ],
              ),
              Visibility(
                  visible: visible,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.05,
                    child: Expanded(
                      child:ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
               SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
              InkWell(
                              onTap: () {
                                setState(() {
                                  _currentTabs = 0;
                                  select1 = '1';
                                });
                              },
                              child: Text(
                                'Minimal Depression',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: select1 == '1'
                                        ? Color(0xff6367EA)
                                        : Colors.grey,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _currentTabs = 1;
                                  select1 = '2';
                                });
                              },
                              child: Text(
                                'Mild Depression',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: select1 == '2'
                                        ? Color(0xff6367EA)
                                        : Colors.grey,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _currentTabs = 2;
                                  select1 = '3';
                                });
                              },
                              child: Text(
                                'Moderate Depression',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: select1 == '3'
                                        ? Color(0xff6367EA)
                                        : Colors.grey,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                             SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _currentTabs = 3;
                                  select1 = '4';
                                });
                              },
                              child: Text(
                                'Moderately severe Depression',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: select1 == '4'
                                        ? Color(0xff6367EA)
                                        : Colors.grey,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                             SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _currentTabs = 4;
                                  select1 = '5';
                                });
                              },
                              child: Text(
                                'Severe Depression',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: select1 == '5'
                                        ? Color(0xff6367EA)
                                        : Colors.grey,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                             SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),

            ],
          ),
                    ),
                  )),
              SizedBox(
                height: 15,
              ),
              Expanded(
                  child: Container(
                color: Color((0XFFECF2FF)),
                child: tabs[_currentTabs],
              ))
            ],
          ),
        ));
  }
}


