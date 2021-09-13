import 'package:bumbutpital/VideoPage/VideoDetail.dart';
import 'package:flutter/material.dart';

class MainVideo extends StatefulWidget {
  @override
  State<MainVideo> createState() => _MainVideoState();
}

class _MainVideoState extends State<MainVideo> {
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
            child: Column(children: [
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
                              'VIDEO',
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  decoration: TextDecoration.none),
                            ),
                          ) //Your widget here,
                          ),
                    ),
                  ],
                )),
              ),
              Row(
                children: [
                  Container(
                    transform: Matrix4.translationValues(50, -25, 0.0),
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
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainVideo()));
                    },
                    child: Container(
                      transform: Matrix4.translationValues(95, -25, 0.0),
                      height: 75,
                      width: 75,
                      child: Column(
                        children: [
                          Icon(
                            Icons.add,
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
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainVideo()));
                    },
                    child: Container(
                      transform: Matrix4.translationValues(140, -25, 0.0),
                      height: 75,
                      width: 75,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainVideo()));
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.psychology_rounded,
                              size: 50,
                              color: Color(0xff706A6A),
                            ),
                            Text('Depression')
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30))),
                          //box video clip
                          child: Row(children: [
                            Container(
                                child: Column(children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => VideoDetail()));
                                },
                                child: Column(
                                  children: [
                                    Stack(children: [
                                      Row(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.all(30),
                                              child: Image.network(
                                                'https://i.ytimg.com/vi/akFQ7JgeEMk/maxresdefault.jpg',
                                                height: 100,
                                                width: 150,
                                              )),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.4,

                                                  // transform:
                                                  //     Matrix4.translationValues(
                                                  //         -20, -30, 0.0),
                                                  child: Text(
                                                    'Topic: โรคภัยใกล้ตัว โรคซึมเศร้า',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.4,
                                                  child: Icon(
                                                      Icons.schedule_outlined),
                                                  alignment: Alignment.topLeft,
                                                ),
                                                Container(
                                                    transform: Matrix4
                                                        .translationValues(
                                                            -30, -20, 0.0),
                                                    child: Text('20 min')),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
                              //box video clip
                              Row(children: [
                                Container(
                                    child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    VideoDetail()));
                                      },
                                      child: Stack(children: [
                                        Row(
                                          children: [
                                            Container(
                                                padding: EdgeInsets.all(30),
                                                child: Image.network(
                                                  'https://i.ytimg.com/vi/akFQ7JgeEMk/maxresdefault.jpg',
                                                  height: 100,
                                                  width: 150,
                                                )),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,

                                                    // transform:
                                                    //     Matrix4.translationValues(
                                                    //         -20, -30, 0.0),
                                                    child: Text(
                                                      'Topic: โรคภัยใกล้ตัว โรคซึมเศร้า',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                    child: Icon(Icons
                                                        .schedule_outlined),
                                                    alignment:
                                                        Alignment.topLeft,
                                                  ),
                                                  Container(
                                                      transform: Matrix4
                                                          .translationValues(
                                                              -30, -20, 0.0),
                                                      child: Text('20 min'))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                    ),
                                  ],
                                ))
                              ]),
                              //Box video clip
                              Row(children: [
                                Container(
                                    child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    VideoDetail()));
                                      },
                                      child: Stack(children: [
                                        Row(
                                          children: [
                                            Container(
                                                padding: EdgeInsets.all(30),
                                                child: Image.network(
                                                  'https://i.ytimg.com/vi/akFQ7JgeEMk/maxresdefault.jpg',
                                                  height: 100,
                                                  width: 150,
                                                )),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,

                                                    // transform:
                                                    //     Matrix4.translationValues(
                                                    //         -20, -30, 0.0),
                                                    child: Text(
                                                      'Topic: โรคภัยใกล้ตัว โรคซึมเศร้า',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                    child: Icon(Icons
                                                        .schedule_outlined),
                                                    alignment:
                                                        Alignment.topLeft,
                                                  ),
                                                  Container(
                                                      transform: Matrix4
                                                          .translationValues(
                                                              -30, -20, 0.0),
                                                      child: Text('20 min'))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                    ),
                                  ],
                                ))
                              ]),
                              //box video clip
                              Row(children: [
                                Container(
                                    child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    VideoDetail()));
                                      },
                                      child: Stack(children: [
                                        Row(
                                          children: [
                                            Container(
                                                padding: EdgeInsets.all(30),
                                                child: Image.network(
                                                  'https://i.ytimg.com/vi/akFQ7JgeEMk/maxresdefault.jpg',
                                                  height: 100,
                                                  width: 150,
                                                )),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,

                                                    // transform:
                                                    //     Matrix4.translationValues(
                                                    //         -20, -30, 0.0),
                                                    child: Text(
                                                      'Topic: โรคภัยใกล้ตัว โรคซึมเศร้า',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                    child: Icon(Icons
                                                        .schedule_outlined),
                                                    alignment:
                                                        Alignment.topLeft,
                                                  ),
                                                  Container(
                                                      transform: Matrix4
                                                          .translationValues(
                                                              -30, -20, 0.0),
                                                      child: Text('20 min'))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                    ),
                                  ],
                                ))
                              ]),
                            ]))
                          ]))))
            ])));
  }
}
