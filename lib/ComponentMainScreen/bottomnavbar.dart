// import 'package:bumbutpital/Authentication/Profile.dart';
// import 'package:bumbutpital/ContentPage/MainContent.dart';
// import 'package:bumbutpital/HospitalPage/MainHospital.dart';
// import 'package:bumbutpital/HospitalPage/PromotionPage.dart';
// import 'package:bumbutpital/Questionare/MainQuestion.dart';

// import 'package:bumbutpital/VideoPage/MainVideo.dart';
import 'package:bumbutpital/Diary/MainDiary.dart';
import 'package:bumbutpital/Forum/MainForumPage.dart';
import 'package:bumbutpital/Main_Screen.dart';
import 'package:bumbutpital/MopHPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final tab = [MainScreen(), MainForumPage(), MainDiary(), MOPHScreen()];
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFECF2FF),
      body: tab[currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color(0xFF7B8CE4),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.help_rounded,
            ),
            label: 'Forum',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.auto_stories_rounded,
            ),
            label: 'Diary',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('asset/image/MOPH_Icon2.png'),
              size: 30,
            ),
            label: 'MOPH',
          ),
        ],
        currentIndex: currentTabIndex,
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
      ),
    );
  }
}
