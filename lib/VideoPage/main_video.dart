import 'package:bumbutpital/widgets/video_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MainVideo extends StatefulWidget {
  @override
  State<MainVideo> createState() => _MainVideoState();
}

class _MainVideoState extends State<MainVideo> {
  int _currentTabs = 5;
  String selected = "1";
  String select1 = "1";
  bool visible1 = true;
  bool visible2 = false;
  bool visible3 = false;
  bool visible4 = false;
  bool visible5 = false;
  bool visible = false;

  final tabs = [
    VideotCard(),
    VideotCard1(),
    VideotCard2(),
    VideotCard3(),
    VideotCard4(),
    VideotCard5(),
    
  ];
  

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
                              'VIDEO',
                              style: GoogleFonts.righteous(
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
                          _currentTabs = 5;
                          selected = '1';
                          visible = false;
                        });
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              transform: Matrix4.translationValues(0, -25, 0.0),
                              height: 75,
                              width: 75,
                              child: Center(
                                child: Column(
                                  children: [
                                    Spacer(),
                                    Icon(
                                      Icons.add,
                                      size: 50,
                                      color: selected == '1'
                                          ? Colors.white
                                          : Colors.grey,
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: selected == '1'
                                      ? Color(0XFFFE7940)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            Container(
                              transform: Matrix4.translationValues(0, -25, 0.0),
                              child: Text(
                                'Recommend',
                                style: GoogleFonts.karla(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          selected = '2';
                          visible = true;
                          _currentTabs = 0;
                          select1 = '1';
                                  visible1 = true;
                                  visible2 = false;
                                  visible3 = false;
                                  visible4 = false;
                                  visible5 = false;
                        });
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              transform: Matrix4.translationValues(0, -25, 0.0),
                              height: 75,
                              width: 75,
                              child: Center(
                                child: Column(
                                  children: [
                                    Spacer(),
                                    Icon(
                                      Icons.library_books,
                                      size: 50,
                                      color: selected == '2'
                                          ? Colors.white
                                          : Colors.grey,
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: selected == '2'
                                      ? Color(0XFF6399EA)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            Container(
                              transform: Matrix4.translationValues(0, -25, 0.0),
                              child: Text(
                                'See All',
                                style: GoogleFonts.karla(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )),
                  Spacer(),
                ],
              ),
              Visibility(
                  visible: visible,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Expanded(
                      child: ListView(
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
                                  visible1 = true;
                                  visible2 = false;
                                  visible3 = false;
                                  visible4 = false;
                                  visible5 = false;
                                });
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: select1 == '1'
                                        ? Color(0xff36DB1B)
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: select1 == '1'
                                          ? Color(0xff36DB1B)
                                          : Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            20.0) //                 <--- border radius here
                                        ),
                                  ),
                                  child: Row(
                                    children: [
                                      Visibility(
                                        visible: visible1,
                                        child: Icon(
                                          Icons.check_circle,
                                          size: 16,
                                          color: selected == '2'
                                              ? Colors.white
                                              : Colors.grey,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Minimal Depression',
                                        style: GoogleFonts.karla(
                                            fontSize: 14,
                                            color: select1 == '1'
                                                ? Colors.white
                                                : Colors.grey,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ))),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  _currentTabs = 1;
                                  select1 = '2';
                                  visible1 = false;
                                  visible2 = true;
                                  visible3 = false;
                                  visible4 = false;
                                  visible5 = false;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: select1 == '2'
                                      ? Color(0xffFFD600)
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: select1 == '2'
                                        ? Color(0xffFFD600)
                                        : Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          20.0) //                 <--- border radius here
                                      ),
                                ),
                                child: Row(
                                    children: [
                                      Visibility(
                                        visible: visible2,
                                        child: Icon(
                                          Icons.check_circle,
                                          size: 16,
                                          color: selected == '2'
                                              ? Colors.white
                                              : Colors.grey,
                                        ),
                                      ),SizedBox(width: 5),
                                      Text(
                                        'Mild Depression',
                                        style: GoogleFonts.karla(
                                            fontSize: 14,
                                            color: select1 == '2'
                                                ? Colors.white
                                                : Colors.grey,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                 
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  _currentTabs = 2;
                                  select1 = '3';
                                   visible1 = false;
                                  visible2 = false;
                                  visible3 = true;
                                  visible4 = false;
                                  visible5 = false;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: select1 == '3'
                                      ? Color(0xff419AED)
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: select1 == '3'
                                        ? Color(0xff419AED)
                                        : Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          20.0) //                 <--- border radius here
                                      ),
                                ),
                                child: Row(
                                    children: [
                                      Visibility(
                                        visible: visible3,
                                        child: Icon(
                                          Icons.check_circle,
                                          size: 16,
                                          color: selected == '2'
                                              ? Colors.white
                                              : Colors.grey,
                                        ),
                                      ),SizedBox(width: 5),
                                      Text(
                                        'Moderate Depression',
                                        style: GoogleFonts.karla(
                                            fontSize: 14,
                                            color: select1 == '3'
                                                ? Colors.white
                                                : Colors.grey,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  _currentTabs = 3;
                                  select1 = '4';
                                   visible1 = false;
                                  visible2 = false;
                                  visible3 = false;
                                  visible4 = true;
                                  visible5 = false;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: select1 == '4'
                                      ? Color(0xffEA9C63)
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: select1 == '4'
                                        ? Color(0xffEA9C63)
                                        : Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          20.0) //                 <--- border radius here
                                      ),
                                ),
                                child: Row(
                                    children: [
                                      Visibility(
                                        visible: visible4,
                                        child: Icon(
                                          Icons.check_circle,
                                          size: 16,
                                          color: selected == '2'
                                              ? Colors.white
                                              : Colors.grey,
                                        ),
                                      ),SizedBox(width: 5),
                                      Text(
                                        'Moderately severe Depression',
                                        style: GoogleFonts.karla(
                                            fontSize: 14,
                                            color: select1 == '4'
                                                ? Colors.white
                                                : Colors.grey,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  _currentTabs = 4;
                                  select1 = '5';
                                   visible1 = false;
                                  visible2 = false;
                                  visible3 = false;
                                  visible4 = false;
                                  visible5 = true;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: select1 == '5'
                                      ? Color(0xffCE2424)
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: select1 == '5'
                                        ? Color(0xffCE2424)
                                        : Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          20.0) //                 <--- border radius here
                                      ),
                                ),
                                child:  Row(
                                    children: [
                                      Visibility(
                                        visible: visible5,
                                        child: Icon(
                                          Icons.check_circle,
                                          size: 16,
                                          color: selected == '2'
                                              ? Colors.white
                                              : Colors.grey,
                                        ),
                                      ),SizedBox(width: 5),
                                      Text(
                                        'Severe Depression',
                                        style: GoogleFonts.karla(
                                            fontSize: 14,
                                            color: select1 == '5'
                                                ? Colors.white
                                                : Colors.grey,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                              )),
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
