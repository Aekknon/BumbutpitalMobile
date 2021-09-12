import 'package:bumbutpital/ComponentMainScreen/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:bumbutpital/ContentPage/ContentDetail.dart';

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Color((0xff6367EA)),
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color((0XFFECF2FF)),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: Color((0xff6367EA)),
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
                          padding: EdgeInsets.only(bottom: 30.0),
                          child: Text(
                            'CONTENT',
                            style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          ),
                        ) //Your widget here,
                        ),
                  ),
                ],
              )),
            ),
            Row(
              children: [
                Container(
                  transform: Matrix4.translationValues(50, -25, 0.0),
                  height: 75,
                  width: 75,
                  child: Column(
                    children: [
                      Icon(
                        Icons.visibility,
                        size: 50,
                      ),
                      Text('see all'),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BottomNavBar()));
                  },
                  child: Container(
                    transform: Matrix4.translationValues(95, -25, 0.0),
                    height: 75,
                    width: 75,
                    child: Column(
                      children: [
                        Icon(
                          Icons.add,
                          size: 50,
                        ),
                        Text('Health')
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContentDetail()));
                  },
                  child: Container(
                    transform: Matrix4.translationValues(140, -25, 0.0),
                    height: 75,
                    width: 75,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContentDetail()));
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.psychology_rounded,
                            size: 50,
                          ),
                          Text('Depression')
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
              ],
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                color: Color((0xffECF2FF)),
                child: Column(children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContentDetail()));
                    },
                    child: Container(
                        height: 250,
                        width: 350,
                        child: Image.network(
                            'https://allwellhealthcare.com/wp-content/uploads/2020/12/depression-disorder.jpg')),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContentDetail()));
                    },
                    child: Container(
                        height: 200,
                        width: 350,
                        child: Image.network(
                            'https://s.isanook.com/he/0/rp/rc/w850h510/yacxacm1w0/aHR0cHM6Ly9zLmlzYW5vb2suY29tL2hlLzAvdWQvMi8xNDU0MS84ODkyMTkuanBn.jpg')),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContentDetail()));
                    },
                    child: Container(
                        height: 200,
                        width: 350,
                        child: Image.network(
                            'https://images.everydayhealth.com/images/coping-with-depression-a-guide-to-good-treatment-1440x810.jpg')),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContentDetail()));
                    },
                    child: Container(
                      height: 200,
                      width: 350,
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScySe5kWvAESop5XqWkQQyEW1mZNPhOA2Y2PZV3hBITdcdp5nj0X7GUBcR22IcZWPQ6Fw&usqp=CAU'),
                    ),
                  )
                ]),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
