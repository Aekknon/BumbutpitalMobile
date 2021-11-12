import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


import 'main_diary.dart';

class WriteDiary extends StatefulWidget {
  const WriteDiary({Key? key}) : super(key: key);

  @override
  _WriteDiaryState createState() => _WriteDiaryState();
}

class _WriteDiaryState extends State<WriteDiary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color(0xffECF2FF),
          elevation: 0,
        ),
        body: Container(
          color: Color(0xffECF2FF),
          height: MediaQuery.of(context).size.height,
          child: Expanded(
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Color(0xffECF2FF),
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Container(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 20, right: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Monday',
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.black,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'May 20',
                                        // textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Spacer()
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: TextField(
                                      
                                      style: TextStyle(
                                          color: Color(0xff6367EA)),
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(fontSize: 24),
                                        hintText: 'Enter Title Diary',
                                        fillColor: Colors.white,
                                        // contentPadding: EdgeInsets.symmetric(
                                        //     vertical: 00, horizontal: 0),
                                        border: UnderlineInputBorder(),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(70),
                            topLeft: Radius.circular(70)),
                      ),
                      child: Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 30, right: 30),
                            child: Container(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 20, right: 20),
                                child: Column(
                                  children: [
                                    
                                      TextField(
                                        maxLines: 15,
                                        // textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Color(0xff6367EA)),
                                        decoration: InputDecoration(
                                          // labelStyle: St,
                                          hintText: 'Enter your story here',
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 24, horizontal: 8),
                                          border: InputBorder.none,
                                        ),
                                      ),

                                    SizedBox(
                                      height: 30,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Color((0xff6367EA)),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 100, vertical: 15),
                                          textStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      child: Text(
                                        'Add Diary',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            decoration: TextDecoration.none),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MainDiary()));
                                      },
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
  }
}
class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}


