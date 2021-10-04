import 'package:flutter/material.dart';
import 'package:bumbutpital/widgets/hospital_card.dart';

class MainHospital extends StatefulWidget {
  @override
  __MainHospitalState createState() => __MainHospitalState();
}

class __MainHospitalState extends State<MainHospital> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: Color(0XFF6367EA),
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color(0XFFECF2FF),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      color: Color(0XFF6367EA),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                    child: Center(
                        child: Column(
                      children: [
                        Expanded(
                          child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  'Hospital',
                                  style: TextStyle(
                                      fontSize: 32,
                                      color: Colors.white,
                                      decoration: TextDecoration.none),
                                ),
                              ) //Your widget here,
                              ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                      child: Container(
                    color: Color((0XFFECF2FF)),
                    child: HospitalCard(),
                  ))
                ],
              ),
            )),
          ],
        ));
  }
}
