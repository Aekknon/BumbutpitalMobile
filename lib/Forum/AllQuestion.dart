import 'package:flutter/material.dart';

class AllQuestion extends StatelessWidget {
  const AllQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Color(hexColor('#ECF2FF')),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Color(hexColor('#ECF2FF')),
        child: Column(children: [
          Container(
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AllQuestion()));
                      },
                      child: Container(
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  color: Color(hexColor('#6367EA')),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12)),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  color: Color(hexColor('#6367EA')),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12)),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  color: Color(hexColor('#6367EA')),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12)),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  color: Color(hexColor('#6367EA')),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12)),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12)),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                        width: 300,
                                        decoration: BoxDecoration(
                                          color: Color(hexColor('#6367EA')),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Q1. I am so stress',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  decoration: TextDecoration.none),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        )),
                                    Container(
                                      width: 300,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                        ),
                                      ),
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 10, left: 10, right: 15),
                                      child: Text(
                                        '  I am so stress. My friend tell me his girlfriend dead for 8 Years. It so sad for me',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            decoration: TextDecoration.none),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Divider(color: Colors.black)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.account_circle_rounded,
                          color: Color(0xFF6367EA),
                          size: 60,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Column(
                            children: [
                              Text(
                                'Dr. Wisa Moolhom',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Do not worry Everything it gonna be OK :)')
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Divider(color: Colors.black)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.account_circle_rounded,
                          color: Color(0xFF6367EA),
                          size: 60,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Column(
                            children: [
                              Text(
                                'Me',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                ' OK :(',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    
                    SizedBox(height: 60,),
                    
                   
                         
            
                  ],
                ),
              ),
            ),
          ),
           Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    // First child is enter comment text input
                    Expanded(
                      child: TextFormField(
                        autocorrect: false,
                        decoration: new InputDecoration(
                          labelText: "Some Text",
                          labelStyle:
                              TextStyle(fontSize: 16.0, color: Colors.black),
                          fillColor: Colors.black,
                          border: OutlineInputBorder(
                              // borderRadius:
                              //     BorderRadius.all(Radius.zero(5.0)),
                              borderSide: BorderSide(color: Colors.purpleAccent)),
                        ),
                      ),
                    ),
                    // Second child is button
                    IconButton(
                      icon: Icon(Icons.send),
                      iconSize: 30.0,
                      onPressed: () {},
                    )
                  ])),
        ],
        
        
      ),)
    );
  }
}

int hexColor(String color) {
  String newColor = '0xff' + color;

  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}
