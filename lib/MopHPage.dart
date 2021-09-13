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
    "https://wenr.wes.org/wp-content/uploads/2019/09/iStock-1142918319_WENR_Ranking_740_430.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOh2gJ9eXdaox-uRpAz3oqWtjDlJ3k0AukWgxlzXg07nH71OpRzx20BZG9JcxkxH3loZc&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnj7GvtqijGyb2focyFejrmqJk1g_Bcjl2qg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV7vJmRomAsYtE3JazzOxK61x63rrsfilphA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0YpfIsnCgTkcz39Z_4-EzgbDsDqh9T0wPfA&usqp=CAU",

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
                SizedBox(height: 40,),
                Container(
                  child: Text('Ministry of Public Health',
          style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              decoration: TextDecoration.none),),),
                Container(
                  child: Text('Our Campaign ',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: TextDecoration.none),),
                ),
                SizedBox(height: 20,),
                Center(
            child: CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlay: true,
              ),
              items: imageList.map((e)=> ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(e,
                    width: 1050.0,
                    height: 350.0,
                    fit: BoxFit.cover,
                    )
                  ],
                ),
              )).toList(),
            ),
      ),
      SizedBox(height: 30,),
      Container(
        child: Text('Infographic',
          style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              decoration: TextDecoration.none),),
      ),
      SizedBox(height: 20,),
      Container(
        height: MediaQuery.of(context).size.height*0.4,
        width: MediaQuery.of(context).size.width*0.8,
        child: Expanded(
          child: GridView.count(
                        scrollDirection: Axis.vertical,
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        shrinkWrap: true,
                        childAspectRatio: 0.7,
                        children: [
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
                                        "https://www.m-culture.go.th/Narathiwat/images/article/news2791/n20210416085857_46969.jpg"),
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
                      ),),
      )
              ],
            ),
          ),
        ),),
    );
  }
}
int hexColor(String color) {
  String newColor = '0xff' + color;

  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}

