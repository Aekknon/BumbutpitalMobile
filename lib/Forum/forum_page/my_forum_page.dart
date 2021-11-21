import 'package:bumbutpital/Forum/add_question.dart';
import 'package:flutter/material.dart';
import 'package:bumbutpital/Forum/forum_page/sub_my_forum_page.dart';
import 'package:google_fonts/google_fonts.dart';

class MyForumPage extends StatefulWidget {
  const MyForumPage({Key? key}) : super(key: key);

  @override
  _MyForumPageState createState() => _MyForumPageState();
}

class _MyForumPageState extends State<MyForumPage> {
  final tabs = [AlreadyAnswer(), NotAnswer()];
  int _currentTabs = 0;
  String selected = "1";

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffECF2FF),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Color(0xff6367EA),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(70),
                        bottomRight: Radius.circular(70)),
                  ),
                  child: Center(
                    child: Text(
                      'My Question',
                      style:  GoogleFonts.righteous(
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
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Center(
              child: Row(
                children: [
                  Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _currentTabs = 0;
                        selected = '1';
                      });
                    },
                    child: Text(
                      'Already Answer',
                      style: GoogleFonts.karla(
                          fontSize: 16,
                          color:
                              selected == '1' ? Color(0xff6367EA) : Colors.grey,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _currentTabs = 1;
                        selected = '2';
                      });
                    },
                    child: Text(
                      'Not Answer',
                      style: GoogleFonts.karla(
                          fontSize: 16,
                          color:  selected == '2' ? Color(0xff6367EA) : Colors.grey,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Expanded(
                child: Container(
              color: Color((0XFFECF2FF)),
              child: tabs[_currentTabs],
            ))
          ],
        ),
      ),
      
    );
  }
}
