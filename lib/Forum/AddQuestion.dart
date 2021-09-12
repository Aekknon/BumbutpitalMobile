import 'package:bumbutpital/Forum/AllQuestion.dart';
import 'package:flutter/material.dart';
import 'MainForumPage.dart';

class AddQuestion extends StatefulWidget {
  AddQuestion({Key? key}) : super(key: key);

  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Color(hexColor('#ECF2FF')),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(hexColor('#ECF2FF')),
        child: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 00, right: 10),
                child: Text(
                  'Q&A',
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 20, right: 20),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          'Title: ',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          style: TextStyle(color: Color(hexColor('#6367EA'))),
                          decoration: InputDecoration(
                            labelText: '    Enter Title Questions',
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(vertical: 00),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 20, right: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Question: ',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          style: TextStyle(color: Color(hexColor('#6367EA'))),
                          decoration: InputDecoration(
                            labelText: '    Enter Questions',
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(vertical: 80),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 60,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(hexColor('#FE7940')),
                    padding:
                        EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                child: Text(
                  'SUBMIT',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      decoration: TextDecoration.none),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainForumPage()));
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}

int hexColor(String color) {
  String newColor = '0xff' + color;

  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}
