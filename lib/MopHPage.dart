import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'ComponentMainScreen/bottomnavbar.dart';

class MophPage extends StatefulWidget {
  MophPage({Key? key}) : super(key: key);

  @override
  _MophPageState createState() => _MophPageState();
}

class _MophPageState extends State<MophPage> {
  final List<String> imageList = [
    "https://img.pptvhd36.com/thumbor/2020/08/30/news-a09890fdc9.jpg",
    "https://www.dharmniti.co.th/wp-content/uploads/2021/07/cover.png",
    "https://www.matichon.co.th/wp-content/uploads/2021/02/EvDcKA1U4AU2z3u-scaled.jpg",
    "https://storage.googleapis.com/techsauce-prod/ugc/uploads/2020/9/120507219_719370788661573_8672059164628905667_n.png",
    "https://i.ytimg.com/vi/tMn3cMkKYUY/maxresdefault.jpg",
  ];
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(hexColor('#ECF2FF')),
        height: MediaQuery.of(context).size.height,
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Text(
                    'Ministry of Public Health',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    'Our Campaign ',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.2,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                    ),
                    items: imageList
                        .map((e) => ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.network(
                                    e,
                                    width: 1050.0,
                                    height: 350.0,
                                    fit: BoxFit.cover,
                                  )
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text(
                    'Infographic',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Expanded(
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 1,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      shrinkWrap: true,
                      childAspectRatio: 0.7,
                      children: [
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => BottomNavBar()));
                        //   },
                        //   child: Container(

                        //     padding: const EdgeInsets.only(
                        //         top: 0, bottom: 10, left: 5, right: 5),
                        //     decoration: BoxDecoration(
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Colors.grey.withOpacity(0.5),
                        //             spreadRadius: 2,
                        //             blurRadius: 5,
                        //             offset: Offset(
                        //                 0, 3), // changes position of shadow
                        //           ),
                        //         ],
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(10)),
                        //         image: DecorationImage(
                        //           image: NetworkImage(
                        //               "https://www.m-culture.go.th/Narathiwat/images/article/news2791/n20210416085857_46969.jpg"),
                        //           fit: BoxFit.cover,
                        //         )),
                        //   ),
                        // ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomNavBar()));
                          },
                          child: Container(
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
                                      "https://mdsoft.co.th/images/knowledge/09_2016/Infographic.png"),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomNavBar()));
                          },
                          child: Container(
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
                                      "https://www.tisi.go.th/data/contact/info/info_8.jpg"),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomNavBar()));
                          },
                          child: Container(
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
                                      "https://lh3.googleusercontent.com/proxy/CAkOBJy3n8_w_y-vsMBziZbn5_7f3M_1ZqxqVzcfhm3rZONLVraEc_pnkbvLs2vZakoVABYpr8yul4hdmFq_p9iRjjQ83vLPDyRkC3XPmS84fBoIOygOw6dfyke1Udv5fGuGFzJkTJPQv8CWI19eH7esHY3gaFXXSegb"),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomNavBar()));
                          },
                          child: Container(
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
                                      "https://datacenter.deqp.go.th//media/images/9/EE/%E0%B8%AA%E0%B8%B2%E0%B8%A3%E0%B8%AD%E0%B8%B1%E0%B8%99%E0%B8%95%E0%B8%A3%E0%B8%B2%E0%B8%A2%E0%B8%AD%E0%B8%B8%E0%B8%9A%E0%B8%B1%E0%B8%95%E0%B8%B4%E0%B9%83%E0%B8%AB%E0%B8%A1%E0%B9%88_final_F_F_Page_1.jpg"),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomNavBar()));
                          },
                          child: Container(
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
                                      "https://cdni-hw.bugaboo.tv/dm/sz-md/i/images/2020/04/30/176632592400000_1588241295_7647.jpg"),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomNavBar()));
                          },
                          child: Container(
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
                                      "https://lh3.googleusercontent.com/proxy/whyTA6LuXRKDaAU-YnB075WxlZWBflJqIagO48UaXtS6fHjfqQWdJo9ZIUs2PXPtse3F8tczLFch8Ostsmf6dyJDWhcBxVd74Pe7dtIiWi9bPiSOsiuj00pqYZTPT7I644NphAq4alGCLjY"),
                                  fit: BoxFit.cover,
                                )),
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
