import 'package:bumbutpital/ContentPage/MainContent.dart';
import 'package:bumbutpital/HospitalPage/MainHospital.dart';
import 'package:bumbutpital/VideoPage/MainVideo.dart';
import 'Questionare/MainQuestion.dart';
import 'package:bumbutpital/Forum/MainForumPage.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MainPage",
      home: Scaffold(
        appBar: AppBar(title: Text("MainPage")),
        body: const ButtonWidget(),
      ),
    );
  }
}

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainContent()));
            },
            child: const Text('ContentPage'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainQuestion()));
            },
            child: const Text('PHQ-9'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainHospital()));
            },
            child: const Text('MainHospitalPage'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainVideo()));
            },
            child: const Text('VideoPage'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainForumPage()));
            },
            child: const Text('ForumPage'),
          ),
        ],
      ),
    );
  }
}
