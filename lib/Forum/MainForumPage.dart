import 'package:bumbutpital/Forum/AddQuestion.dart';
import 'package:flutter/material.dart';
import 'AllQuestion.dart';

class MainForumPage extends StatefulWidget {
  MainForumPage({Key? key}) : super(key: key);

  @override
  _MainForumPageState createState() => _MainForumPageState();
}

class _MainForumPageState extends State<MainForumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(hexColor('#ECF2FF')),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Color(hexColor('#6367EA')),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(70),
                        bottomRight: Radius.circular(70)),
                  ),
                  child: Center(
                    child: Text(
                      'FORUM Q&A',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          decoration: TextDecoration.none),
                    ),
                  ),
                ),
                Spacer()
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AllQuestion()));
                  },
                  child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            width: 300,
                            decoration: BoxDecoration(
                              color: Color(hexColor('#6367EA')),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 300,
                            decoration: BoxDecoration(
                              color: Color(hexColor('#6367EA')),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 300,
                            decoration: BoxDecoration(
                              color: Color(hexColor('#6367EA')),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 300,
                            decoration: BoxDecoration(
                              color: Color(hexColor('#6367EA')),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 300,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                    width: 300,
                                    decoration: BoxDecoration(
                                      color: Color(hexColor('#6367EA')),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Q1. I am so stress',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              decoration: TextDecoration.none),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    )),
                                Container(
                                  width: 300,
                                  color: Colors.white,
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10, left: 30, right: 10),
                                  child: Text(
                                    '  I am so stress. My friend tell me his girlfriend dead for 9 Years. It so sad for me',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 5,
                                        left: 10,
                                        right: 10),
                                    child: Column(
                                      children: [
                                        Text(
                                          'ANS : Good',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              decoration: TextDecoration.none),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Dr. WIsa Moolhom',
                                          style: TextStyle(
                                              fontSize: 8,
                                              color: Colors.black,
                                              decoration: TextDecoration.none),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddQuestion()));
          },
          child: const Icon(Icons.add),
          backgroundColor: Color(hexColor('#6367EA'))),
      
    );
  }
}

int hexColor(String color) {
  String newColor = '0xff' + color;

  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}
