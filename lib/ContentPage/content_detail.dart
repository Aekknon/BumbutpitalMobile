import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      result[0].toString(),
                    ),
                    fit: BoxFit.cover,
                  )),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 250,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(result[1],
                  style: GoogleFonts.rubik(fontSize: 24,fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Spacer(),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(result[3].toString().substring(0, 24),
                      style: TextStyle(
                        fontSize: 10,
                      )),
                ),
              ],
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(result[2],style: GoogleFonts.karla(fontSize: 16,))
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
