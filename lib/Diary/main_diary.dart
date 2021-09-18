import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'write_diary.dart';
import 'diary_detail.dart';

class MainDiary extends StatefulWidget {
  MainDiary({Key? key}) : super(key: key);

  @override
  _MainDiaryState createState() => _MainDiaryState();
}

class _MainDiaryState extends State<MainDiary> {
  final List<String> imageList = [
    "https://fbi.dek-d.com/27/0833/6340/131125299",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOh2gJ9eXdaox-uRpAz3oqWtjDlJ3k0AukWgxlzXg07nH71OpRzx20BZG9JcxkxH3loZc&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnj7GvtqijGyb2focyFejrmqJk1g_Bcjl2qg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV7vJmRomAsYtE3JazzOxK61x63rrsfilphA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0YpfIsnCgTkcz39Z_4-EzgbDsDqh9T0wPfA&usqp=CAU",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffECF2FF),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Color(0xff6367EA),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(70),
                        bottomRight: Radius.circular(70)),
                  ),
                  child: Center(
                    child: Text(
                      'Diary',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          decoration: TextDecoration.none),
                    ),
                  ),
                ),
                Spacer()
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                    top: 34, bottom: 10, left: 5, right: 5),
                color: Color(0xffECF2FF),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 5, bottom: 10, left: 10, right: 10),
                  child: GridView.count(
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 1,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    shrinkWrap: true,
                    childAspectRatio: 1.5,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DiaryDetail()));
                        },
                        child: Container(
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
                                    "https://storage.thaipost.net/main/uploads/photos/big/20200127/image_big_5e2e947024c9f.jpg"),
                                fit: BoxFit.cover,
                              )),
                              child: Center(
                                child: Column(children: [
                                  Spacer(),
                                  Row(
                                    children: [
                                     
                                      Container(
                                  height: 120,
                                  width: 120,
                                  
                                   decoration: BoxDecoration(
                                     color: Colors.white,
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
                              
                              ),
                              child: Column(children: [
                                SizedBox(height: 25,),
                                Text('Topic:',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none),),
               Text('Market',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              
              decoration: TextDecoration.none),),
                              ],)
                                ), Spacer()
                                    ],
                                  )
                                ],)
                              ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DiaryDetail()));
                        },
                        child: Container(
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
                                    "https://www.greatstarsdigital.com/wp-content/uploads/2018/04/%E0%B8%84%E0%B8%A3%E0%B8%AD%E0%B8%9A%E0%B8%84%E0%B8%A3%E0%B8%B1%E0%B8%A7%E0%B8%AD%E0%B8%9A%E0%B8%AD%E0%B8%B8%E0%B9%88%E0%B8%99_180413_0013.jpg"),
                                fit: BoxFit.cover,
                              )),
                              child: Center(
                                child: Column(children: [
                                  Spacer(),
                                  Row(
                                    children: [
                                     
                                      Container(
                                  height: 120,
                                  width: 120,
                                  
                                   decoration: BoxDecoration(
                                     color: Colors.white,
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
                              
                              ),
                              child: Column(children: [
                                SizedBox(height: 25,),
                                Text('Topic:',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none),),
               Text('Market',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              
              decoration: TextDecoration.none),),
                              ],)
                                ), Spacer()
                                    ],
                                  )
                                ],)
                              ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DiaryDetail()));
                        },
                        child: Container(
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
                                    "https://entertain.teenee.com/gossip/img3/1852425.jpg"),
                                fit: BoxFit.cover,
                              )),
                              child: Center(
                                child: Column(children: [
                                  Spacer(),
                                  Row(
                                    children: [
                                     
                                      Container(
                                  height: 120,
                                  width: 120,
                                  
                                   decoration: BoxDecoration(
                                     color: Colors.white,
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
                              
                              ),
                              child: Column(children: [
                                SizedBox(height: 25,),
                                Text('Topic:',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none),),
               Text('Market',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              
              decoration: TextDecoration.none),),
                              ],)
                                ), Spacer()
                                    ],
                                  )
                                ],)
                              ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DiaryDetail()));
                        },
                        child: Container(
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
                                    "https://news.kaazip.com/wp-content/uploads/2021/04/%E0%B8%81%E0%B8%B8%E0%B8%A5%E0%B9%81%E0%B8%88%E0%B8%8B%E0%B8%AD%E0%B8%A5-2.jpg"),
                                fit: BoxFit.cover,
                              )),
                              child: Center(
                                child: Column(children: [
                                  Spacer(),
                                  Row(
                                    children: [
                                     
                                      Container(
                                  height: 120,
                                  width: 120,
                                  
                                   decoration: BoxDecoration(
                                     color: Colors.white,
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
                              
                              ),
                              child: Column(children: [
                                SizedBox(height: 25,),
                                Text('Topic:',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none),),
               Text('Market',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              
              decoration: TextDecoration.none),),
                              ],)
                                ), Spacer()
                                    ],
                                  )
                                ],)
                              ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DiaryDetail()));
                        },
                        child: Container(
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
                                    "https://www.princubon.com/wp-content/uploads/2021/01/%E0%B8%84%E0%B8%99%E0%B8%A5%E0%B8%B0%E0%B8%84%E0%B8%A3%E0%B8%B6%E0%B9%88%E0%B8%87_1040x1040px-768x768.png"),
                                fit: BoxFit.cover,
                              )),
                              child: Center(
                                child: Column(children: [
                                  Spacer(),
                                  Row(
                                    children: [
                                     
                                      Container(
                                  height: 120,
                                  width: 120,
                                  
                                   decoration: BoxDecoration(
                                     color: Colors.white,
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
                              
                              ),
                              child: Column(children: [
                                SizedBox(height: 25,),
                                Text('Topic:',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none),),
               Text('Market',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              
              decoration: TextDecoration.none),),
                              ],)
                                ), Spacer()
                                    ],
                                  )
                                ],)
                              ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DiaryDetail()));
                        },
                        child: Container(
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
                                    "https://i0.wp.com/www.amarinbabyandkids.com/app/uploads/2017/01/shutterstock_124904711-e1483514453518.jpg"),
                                fit: BoxFit.cover,
                              )),
                              child: Center(
                                child: Column(children: [
                                  Spacer(),
                                  Row(
                                    children: [
                                     
                                      Container(
                                  height: 120,
                                  width: 120,
                                  
                                   decoration: BoxDecoration(
                                     color: Colors.white,
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
                              
                              ),
                              child: Column(children: [
                                SizedBox(height: 25,),
                                Text('Topic:',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none),),
               Text('Market',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              
              decoration: TextDecoration.none),),
                              ],)
                                ), Spacer()
                                    ],
                                  )
                                ],)
                              ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DiaryDetail()));
                        },
                        child: Container(
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
                                    "https://line-mag.com/wp-content/uploads/2021/05/%E0%B8%95%E0%B8%B1%E0%B9%8A%E0%B8%81-%E0%B8%99%E0%B8%B8%E0%B9%89%E0%B8%A2.jpg"),
                                fit: BoxFit.cover,
                              )),
                              child: Center(
                                child: Column(children: [
                                  Spacer(),
                                  Row(
                                    children: [
                                     
                                      Container(
                                  height: 120,
                                  width: 120,
                                  
                                   decoration: BoxDecoration(
                                     color: Colors.white,
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
                              
                              ),
                              child: Column(children: [
                                SizedBox(height: 25,),
                                Text('Topic:',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none),),
               Text('Market',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              
              decoration: TextDecoration.none),),
                              ],)
                                ), Spacer()
                                    ],
                                  )
                                ],)
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 120,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => WriteDiary()));
          },
          child: const Icon(Icons.add),
          backgroundColor: Color(0xFFA9B0FF),),
    );
  }
}
