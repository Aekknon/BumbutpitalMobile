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

  final tabs = [ContentCard(), ContentCard1(), ContentCard2()];

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
                  SizedBox(width: MediaQuery.of(context).size.width * 0.125),
                  InkWell(
                    onTap: () => _onChangeTab(0),
                    child: Container(
                      transform: Matrix4.translationValues(0, -25, 0.0),
                      height: 75,
                      width: 75,
                      child: Column(
                        children: [
                          Icon(
                            Icons.visibility,
                            size: 50,
                            color: Color(0xff706A6A),
                          ),
                          Text('see all'),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  InkWell(
                    onTap: () => _onChangeTab(1),
                    child: Container(
                      transform: Matrix4.translationValues(0, -25, 0.0),
                      height: 75,
                      width: 75,
                      child: Column(
                        children: [
                          Icon(
                            Icons.health_and_safety_rounded,
                            size: 50,
                            color: Color(0xff706A6A),
                          ),
                          Text('Health')
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  InkWell(
                    onTap: () => _onChangeTab(2),
                    child: Container(
                      transform: Matrix4.translationValues(0, -25, 0.0),
                      height: 75,
                      width: 75,
                      child: Column(
                        children: [
                          Icon(
                            Icons.psychology_rounded,
                            size: 50,
                            color: Color(0xff706A6A),
                          ),
                          Text(
                            'Depression',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ],
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
