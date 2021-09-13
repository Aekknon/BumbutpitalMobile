import 'package:flutter/material.dart';
import 'package:bumbutpital/Diary/MainDiary.dart';

class DiaryDetail extends StatefulWidget {
  DiaryDetail({Key? key}) : super(key: key);

  @override
  _DiaryDetailState createState() => _DiaryDetailState();
}

class _DiaryDetailState extends State<DiaryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        
        
        backgroundColor: Color(hexColor('#ECF2FF')),
        elevation: 0,
      ),
      body: Container(
         color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Expanded(
          child: SingleChildScrollView(
            child: Container(
              child: Column(children: [
                Container(
                  color: Color(hexColor('#ECF2FF')),
                  height: MediaQuery.of(context).size.height*0.3,
                  child:   Container(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 20, right: 20),
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
                                      BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40),),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://storage.thaipost.net/main/uploads/photos/big/20200127/image_big_5e2e947024c9f.jpg"),
                                    fit: BoxFit.cover,)
                                  )),
                  
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    
                        
                  ),
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        
                       padding:
                const EdgeInsets.only(top: 34, bottom: 10, left: 30, right: 30),
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 20, right: 20),
                  child: Column(
                    children: [
                      
                      Text('Market',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),),
                      SizedBox(height: 20,),
                      Text('         Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              decoration: TextDecoration.none),),
                      SizedBox(height: 60,),
                      
                    ],
                  )),
                      ),
                    ),),
                ),
                
              ],),
            ),),),
      )
    );
  }
}
