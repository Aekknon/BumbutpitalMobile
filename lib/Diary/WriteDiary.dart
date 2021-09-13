import 'package:flutter/material.dart';

import 'MainDiary.dart';

class WriteDiary extends StatefulWidget {
  WriteDiary({Key? key}) : super(key: key);

  @override
  _WriteDiaryState createState() => _WriteDiaryState();
}

class _WriteDiaryState extends State<WriteDiary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        
        
        backgroundColor: Color(hexColor('#ECF2FF')),
        elevation: 0,
      ),
      body: Container(
         color: Color(hexColor('#ECF2FF')),
        height: MediaQuery.of(context).size.height,
        child: Expanded(
          child: SingleChildScrollView(
            child: Container(
              child: Column(children: [
                Container(
                  color: Color(hexColor('#ECF2FF')),
                  height: MediaQuery.of(context).size.height*0.2,
                  child:   Container(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 15,),
                         Column(
                           children: [
                              Text('Monday',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold),),
                      Text('May 20',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            ),),
                           ],
                         ),
                            Spacer()
                        ],
                      ),
                      SizedBox(height: 25,),
                      Row(
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
                  )
                    ],
                  )),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(70),
                        topLeft: Radius.circular(70)),
                        
                  ),
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        
                       padding:
                const EdgeInsets.only(top: 34, bottom: 10, left: 30, right: 30),
                child: Container(
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
                            
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.2),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(hexColor('#FE7940')),
                            padding:
                                EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
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
                                  builder: (context) =>MainDiary()));
                        },
                      ),
                    ],
                  )),
                      ),
                    ),),
                ),
                
              ],),
            ),),),
      )
    );

  }
}

int hexColor(String color) {
  String newColor = '0xff' + color;

  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}
