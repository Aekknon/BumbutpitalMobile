import 'package:flutter/material.dart';

class ContentDetail extends StatelessWidget {
  const ContentDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> result =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
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
            
            Container(
                
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  result[0].toString(),
                )),
            SizedBox(
              height: 10,
            ),
            
                 Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(result[1],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 30,
            ),
            Row(children: [
              Spacer(),
              Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(result[3].toString().substring(0,24),
                style: TextStyle(fontSize: 10, )),
            ),
            ],),
            Divider(
              color: Colors.black
            ),
             SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(result[2]),
            ),
            SizedBox(
              height: 20,
            )
          ],
        )),
      ),
    );
  }
}
