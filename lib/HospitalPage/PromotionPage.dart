import 'package:bumbutpital/HospitalPage/KeepkoopongPage.dart';
import 'package:flutter/material.dart';

class PromotionPage extends StatefulWidget {
  PromotionPage({Key? key}) : super(key: key);

  @override
  _PromotionPageState createState() => _PromotionPageState();
}

class _PromotionPageState extends State<PromotionPage> {
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
        backgroundColor: Color(hexColor('#ECF2FF')),
        elevation: 0,
      ),
      body: Container(
        color: Color(hexColor('#ECF2FF')),
        child: Center(
          child: Container(
            padding:
                const EdgeInsets.only(top: 34, bottom: 10, left: 5, right: 5),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 5, bottom: 10, left: 10, right: 10),
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 1,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      shrinkWrap: true,
                      childAspectRatio: 2,
                      children: [
                        Container(
                          height: 200,
                          width: 150,
                          padding: const EdgeInsets.only(
                              top: 0, bottom: 10, left: 5, right: 5),
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
                                    "https://www.checkraka.com/uploaded/article/news/1363445/scb_hospital-cb8000b.jpg"),
                                fit: BoxFit.cover,
                              )),
                          child: Expanded(
                            child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: 0.0),
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.9,
                                      padding: const EdgeInsets.only(
                                          top: 0,
                                          bottom: 10,
                                          left: 300,
                                          right: 5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent,
                                      ),
                                      child: Center(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary:
                                                  Color(hexColor('#6367EA')),
                                              shape: CircleBorder(),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          child: Icon(
                                            Icons.arrow_right_alt,
                                            size: 24,
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        KeepkoopongPage()));
                                          },
                                        ),
                                      ))),
                            ),
                          ),
                        ),
                        Container(
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
                                    "https://www.ryt9.com/img/files/20201216/iq447ecb23e7e8f1c71eac9e63e354225b.jpg"),
                                fit: BoxFit.cover,
                              )),
                          child: Expanded(
                            child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: 0.0),
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.9,
                                      padding: const EdgeInsets.only(
                                          top: 0,
                                          bottom: 10,
                                          left: 300,
                                          right: 5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent,
                                      ),
                                      child: Center(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary:
                                                  Color(hexColor('#6367EA')),
                                              shape: CircleBorder(),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          child: Icon(
                                            Icons.arrow_right_alt,
                                            size: 24,
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        KeepkoopongPage()));
                                          },
                                        ),
                                      ))),
                            ),
                          ),
                        ),
                        Container(
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
                                    "https://www.princpaknampo.com/wp-content/uploads/2020/12/Screen-Shot-2564-01-18-at-13.59.41.png"),
                                fit: BoxFit.cover,
                              )),
                          child: Expanded(
                            child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: 0.0),
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.9,
                                      padding: const EdgeInsets.only(
                                          top: 0,
                                          bottom: 10,
                                          left: 300,
                                          right: 5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent,
                                      ),
                                      child: Center(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary:
                                                  Color(hexColor('#6367EA')),
                                              shape: CircleBorder(),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          child: Icon(
                                            Icons.arrow_right_alt,
                                            size: 24,
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        KeepkoopongPage()));
                                          },
                                        ),
                                      ))),
                            ),
                          ),
                        ),
                        Container(
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
                                    "https://www.princubon.com/wp-content/uploads/2021/01/%E0%B8%84%E0%B8%99%E0%B8%A5%E0%B8%B0%E0%B8%84%E0%B8%A3%E0%B8%B6%E0%B9%88%E0%B8%87_1040x1040px-768x768.png"),
                                fit: BoxFit.cover,
                              )),
                          child: Expanded(
                            child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: 0.0),
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.9,
                                      padding: const EdgeInsets.only(
                                          top: 0,
                                          bottom: 10,
                                          left: 300,
                                          right: 5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent,
                                      ),
                                      child: Center(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary:
                                                  Color(hexColor('#6367EA')),
                                              shape: CircleBorder(),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          child: Icon(
                                            Icons.arrow_right_alt,
                                            size: 24,
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        KeepkoopongPage()));
                                          },
                                        ),
                                      ))),
                            ),
                          ),
                        ),
                        Container(
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
                                    "https://www.ryt9.com/img/files/20200804/iqdf770d12b6493850659fef554b9a1bf6.jpg"),
                                fit: BoxFit.cover,
                              )),
                          child: Expanded(
                            child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: 0.0),
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.9,
                                      padding: const EdgeInsets.only(
                                          top: 0,
                                          bottom: 10,
                                          left: 300,
                                          right: 5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent,
                                      ),
                                      child: Center(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary:
                                                  Color(hexColor('#6367EA')),
                                              shape: CircleBorder(),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          child: Icon(
                                            Icons.arrow_right_alt,
                                            size: 24,
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        KeepkoopongPage()));
                                          },
                                        ),
                                      ))),
                            ),
                          ),
                        ),
                        Container(
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
                                    "https://www.thaipr.net/wp-content/uploads/2021/05/Line@%E0%B9%82%E0%B8%9B%E0%B8%A3%E0%B9%82%E0%B8%A1%E0%B8%8A%E0%B8%B1%E0%B9%88%E0%B8%99-%E0%B8%9E%E0%B8%A4%E0%B8%A9%E0%B8%A0%E0%B8%B2%E0%B8%84%E0%B8%A1-2564-01-6c9962c0.jpg"),
                                fit: BoxFit.cover,
                              )),
                          child: Expanded(
                            child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: 0.0),
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.9,
                                      padding: const EdgeInsets.only(
                                          top: 0,
                                          bottom: 10,
                                          left: 300,
                                          right: 5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent,
                                      ),
                                      child: Center(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary:
                                                  Color(hexColor('#6367EA')),
                                              shape: CircleBorder(),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          child: Icon(
                                            Icons.arrow_right_alt,
                                            size: 24,
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        KeepkoopongPage()));
                                          },
                                        ),
                                      ))),
                            ),
                          ),
                        ),
                      ],
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

int hexColor(String color) {
  String newColor = '0xff' + color;

  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}
