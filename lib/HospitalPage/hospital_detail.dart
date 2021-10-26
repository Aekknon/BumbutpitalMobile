import 'package:bumbutpital/HospitalPage/keep_koopong_screen.dart';
import 'package:bumbutpital/HospitalPage/promotion_screen.dart';
import 'package:bumbutpital/widgets/promotion_in_hospital_detail_card.dart';
import 'package:flutter/material.dart';

class HospitalDetail extends StatefulWidget {
  const HospitalDetail({Key? key}) : super(key: key);

  @override
  _HospitalDetailState createState() => _HospitalDetailState();
}

class _HospitalDetailState extends State<HospitalDetail> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> result = ModalRoute.of(context)!.settings.arguments as List<dynamic>  ;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 10, left: 5, right: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: NetworkImage(
                            result[2]),
                      )),
                ),
                Container(
                  // height: MediaQuery.of(context).size.height * 0.3,
                  // width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.only(top: 5, bottom: 10, left: 5, right: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Text(
                        result[0],
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Column(
                          children: [
                            Text(
                                result[1],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                ),
                               
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                                  child: Text(
                                    'Promotion',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PromotionPage()));
                                  },
                                  child: Text(
                                    'See all',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.blue,
                                        decoration: TextDecoration.none),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 5, bottom: 10, left: 10, right: 10),
                                  child: Expanded(
                                    child: promotioninhospitaldetail_card()
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}