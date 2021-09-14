import 'package:flutter/material.dart';



class ContentDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFECF2FF),
      appBar: AppBar(
        backgroundColor: Color(0XFFECF2FF),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              child: Container(
                transform: Matrix4.translationValues(-110, 0, 0),
                // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  'What is ?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 400,
              width: 500,
              child: Image.network(
                  'https://health.mil/-/media/Images/MHS/Infographics/DCOE/DCoE_PAO_depression101_Infographic_mediumsize_20151029.ashx?h=1250&la=en&w=1025&hash=972DFBF598052DA84DD4E2ABB3FB6291A6667774B6E550AA05F4493C4CCDF039'),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text('What is Depresstion?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
                  'Praesent dapibus id tortor ut venenatis. Aenean dapibus'
                  'tellus arcu, ut congue purus malesuada varius. Mauris ut molestie metus, a imperdiet ipsum. Aenean accumsan ultricies lacus et posuere.'),
            )
          ],
        )),
      ),
    );
  }
}
