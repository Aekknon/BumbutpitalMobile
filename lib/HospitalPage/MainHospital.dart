import 'package:bumbutpital/HospitalPage/HospitalDetail.dart';
import 'package:flutter/material.dart';

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
        backgroundColor: Color(hexColor('#6367EA')),
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(hexColor('#ECF2FF')),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: Color(hexColor('#6367EA')),
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
                  )
                ],
              )),
            ),
            Expanded(
              child: Container(
                color: Color(hexColor('#ECF2FF')),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.79,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
                  child: GridView.count(
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 1,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    shrinkWrap: true,
                    childAspectRatio: 2,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HospitalDetail()));
                        },
                        child: Container(
                          height: 200,
                          width: 150,
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 10, left: 5, right: 5),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://hdmall.co.th/system/redactor2_assets/images/5985/content_%E0%B8%A3%E0%B8%9E.%E0%B8%A2%E0%B8%B1%E0%B8%99%E0%B8%AE%E0%B8%B5.jpg"),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HospitalDetail()));
                        },
                        child: Container(
                          height: 200,
                          width: 150,
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 10, left: 5, right: 5),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://f.ptcdn.info/957/059/000/pfp0l22atn04mEHVgaqd-o.jpg"),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HospitalDetail()));
                        },
                        child: Container(
                          height: 200,
                          width: 150,
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 10, left: 5, right: 5),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.matichon.co.th/wp-content/uploads/2019/12/11-23.jpg"),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HospitalDetail()));
                        },
                        child: Container(
                          height: 200,
                          width: 150,
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 10, left: 5, right: 5),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.chaophya.com/wp-content/uploads/2018/04/photo-05.png"),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HospitalDetail()));
                        },
                        child: Container(
                          height: 200,
                          width: 150,
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 10, left: 5, right: 5),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.phyathai-sriracha.com/pytsweb/html_blank/aboutus/history.jpg"),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HospitalDetail()));
                        },
                        child: Container(
                          height: 200,
                          width: 150,
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 10, left: 5, right: 5),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.mymeditravel.com/cdn-cgi/image/f=auto,fit=contain,quality=75/uploads/property/gallery/5ebefe082c307c04031738dd/5ef970d54da4c410335172ec/medium.jpg"),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HospitalDetail()));
                        },
                        child: Container(
                          height: 200,
                          width: 150,
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 10, left: 5, right: 5),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://hdmall.co.th/system/redactor2_assets/images/5985/content_%E0%B8%A3%E0%B8%9E.%E0%B8%A2%E0%B8%B1%E0%B8%99%E0%B8%AE%E0%B8%B5.jpg"),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HospitalDetail()));
                        },
                        child: Container(
                          height: 200,
                          width: 150,
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 10, left: 5, right: 5),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://f.ptcdn.info/957/059/000/pfp0l22atn04mEHVgaqd-o.jpg"),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
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
