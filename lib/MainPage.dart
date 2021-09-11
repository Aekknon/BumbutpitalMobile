import 'package:bumbutpital/Authentication/Profile.dart';
import 'package:bumbutpital/ContentPage/MainContent.dart';
import 'package:bumbutpital/HospitalPage/MainHospital.dart';
import 'package:bumbutpital/HospitalPage/PromotionPage.dart';
import 'package:bumbutpital/Questionare/MainQuestion.dart';
import 'package:bumbutpital/Questionare/QuestionScreen.dart';
import 'package:bumbutpital/VideoPage/MainVideo.dart';
import 'package:flutter/material.dart';

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
                      width: 350,
                      height: 149,
                      color: Color(0xFFA9B0FF),
                      padding: EdgeInsets.all(20),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Content',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
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
                      color: Color(0xFFA9B0FF),
                      padding: EdgeInsets.all(10),
                      // decoration: BoxDecoration(
                      // borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Hospital ads.',
                          style: TextStyle(fontSize: 12),
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
                  InkWell(
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
                          color: Color(0xFFA9B0FF),
                          padding: EdgeInsets.all(10),
                          // decoration: BoxDecoration(
                          // borderRadius: BorderRadius.all(Radius.circular(8))),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'PHQ-9',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
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
                          color: Color(0xFFA9B0FF),
                          padding: EdgeInsets.all(10),
                          // decoration: BoxDecoration(
                          // borderRadius: BorderRadius.all(Radius.circular(8))),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Promotion',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
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
                        Container(
                          margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                          width: 350,
                          height: 80,
                          color: Color(0xFFA9B0FF),
                          padding: EdgeInsets.all(20),
                          // decoration: BoxDecoration(
                          // borderRadius: BorderRadius.all(Radius.circular(8))),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Department of mental Health',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help_outline_rounded),
              label: 'Question',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.import_contacts),
              label: 'Diary',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(
                  "asset/image/Ministry_of_Public_Health_of_Thailand.svg.png")),
              label: 'MOPH',
            ),
          ],
        ),
      ),
    );
  }
}
