import 'package:bumbutpital/HospitalPage/QRcodePage.dart';
import 'package:flutter/material.dart';

class KeepkoopongPage extends StatefulWidget {
  KeepkoopongPage({Key? key}) : super(key: key);

  @override
  _KeepkoopongPageState createState() => _KeepkoopongPageState();
}

class _KeepkoopongPageState extends State<KeepkoopongPage> {
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
          color: Color(hexColor('#ECF2FF')),
          height: MediaQuery.of(context).size.height,
          child: Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.checkraka.com/uploaded/article/news/1363445/scb_hospital-cb8000b.jpg"),
                              fit: BoxFit.cover,
                            )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'ดูแลคุณด้วยใจ',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            color: Color(hexColor('#6367EA')),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text(
                              'เหลือเวลาอีก 12 วัน -หมดอายุ 31 ธ.ค. 64',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'เงื่อนไขการใช้งาน',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          '         Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(hexColor('#FE7940')),
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 15),
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        child: Text(
                          'Get Promotion',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              decoration: TextDecoration.none),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QRCodePage()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

int hexColor(String color) {
  String newColor = '0xff' + color;

  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}
