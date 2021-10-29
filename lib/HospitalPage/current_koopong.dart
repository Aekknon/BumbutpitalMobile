import 'package:bumbutpital/HospitalPage/keep_koopong_screen.dart';
import 'package:flutter/material.dart';
import 'package:bumbutpital/widgets/promotion_card.dart';

class CurrentPromotionPage extends StatefulWidget {
  CurrentPromotionPage({Key? key}) : super(key: key);

  @override
  _PromotionPageState createState() => _PromotionPageState();
}

class _PromotionPageState extends State<CurrentPromotionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          "Promotion",
          style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
        backgroundColor: Color(0xffECF2FF),
        elevation: 0,
      ),
      body: Container(
        color: Color(0XFFECF2FF),
        child: Center(
          child: Container(
            padding:
                const EdgeInsets.only(top: 34, bottom: 10, left: 5, right: 5),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.85,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 5, bottom: 10, left: 10, right: 10),
                      child:  CurrentPromotionCard(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}