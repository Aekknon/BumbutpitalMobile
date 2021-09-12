import 'package:bumbutpital/Authentication/Profile.dart';
import 'package:bumbutpital/ContentPage/MainContent.dart';
import 'package:bumbutpital/HospitalPage/MainHospital.dart';
import 'package:bumbutpital/HospitalPage/PromotionPage.dart';
import 'package:bumbutpital/Questionare/MainQuestion.dart';
import 'ComponentMainScreen/bottomnavbar.dart';
import 'package:bumbutpital/VideoPage/MainVideo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MainPage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MainPage",
      home: Scaffold(
        backgroundColor: Color(0XFFECF2FF),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
                      child: IconButton(
                        icon: Icon(
                          Icons.account_circle_rounded,
                          color: Color(0xFF6367EA),
                          size: 60,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(padding: EdgeInsets.all(16)),
                  Text('Hello,',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                ],
              ),
              Row(
                children: [
                  Container(padding: EdgeInsets.all(16)),
                  Text('Username!',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    child: Image.asset('asset/image/HeadHeart.png'),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainContent()));
                },
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      width: 350,
                      height: 149,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Color(0xFFA9B0FF),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Content',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      transform: Matrix4.translationValues(-45, -10, 0.0),
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        'asset/image/DoctorMainPage.png',
                        width: 165,
                        height: 165,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainHospital()));
                },
                child: Stack(
                  children: [
                    Container(
                      width: 350,
                      height: 35,

                      // padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Color(0xFF7B8CE4)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Hospital ads.',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainQuestion()));
                      },
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                            width: 150,
                            height: 80,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Color(0xFFA9B0FF),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.fact_check_outlined,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.all(6),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'PHQ-9',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PromotionPage()));
                      },
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            width: 150,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Color(0xFFA9B0FF),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.card_giftcard_outlined,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.all(7),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Promotion',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainVideo()));
                    },
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                              width: 350,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Color(0xFFA9B0FF),
                              ),
                              padding: EdgeInsets.all(20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Department of mental Health',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              transform: Matrix4.translationValues(-55, 0, 0),
                              child: Icon(
                                Icons.play_circle_fill,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(),
            ]),
          ),
        ),
        
      ),
    );
  }
}
