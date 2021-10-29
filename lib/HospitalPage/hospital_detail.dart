import 'package:bumbutpital/HospitalPage/keep_koopong_screen.dart';
import 'package:bumbutpital/HospitalPage/promotion_screen.dart';
import 'package:bumbutpital/widgets/promotion_in_hospital_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HospitalDetail extends StatefulWidget {
  const HospitalDetail({Key? key}) : super(key: key);

  @override
  _HospitalDetailState createState() => _HospitalDetailState();
}

const query = """
                    query {
    getAllPromotion{
      promotionId
      hospitalId
      title
      hospitalDetail
      couponCode
      Url
      expiredDate

    }
  }                """;

const query1 = """
                    query {
    getPromotionLog{
      userId
      usedpromotionId
      keeppromotionId
      status
      

    }
  }                """;

class _HospitalDetailState extends State<HospitalDetail> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> promoResult =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
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
                        image: NetworkImage(promoResult[2]),
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
                        promoResult[0],
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
                            Text(promoResult[1],
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
                                    child: Query(
                                      options: QueryOptions(
                                          document: gql(query),
                                          pollInterval: Duration(seconds: 1)),
                                      builder: (QueryResult result,
                                          {fetchMore, refetch}) {
                                        if (result.hasException) {
                                          return Text(
                                              result.exception.toString());
                                        }
                                        if (result.isLoading) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }

                                        if (result.data == null) {
                                          return Text(result.toString());
                                        }

                                        return Query(
                                          options: QueryOptions(
                                              document: gql(query1),
                                              pollInterval:
                                                  Duration(seconds: 1)),
                                          builder: (QueryResult result1,
                                              {fetchMore, refetch}) {
                                            if (result.hasException) {
                                              return Text(
                                                  result.exception.toString());
                                            }
                                            if (result.isLoading) {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }

                                            if (result.data == null) {
                                              return Text(result.toString());
                                            }
                                            bool visible = true;
                                            return Column(
                                              children: [
                                                Expanded(
                                                  child: ListView.builder(
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      bool visible = false;
                                                      int x = 0;

                                                      if (result.data![
                                                                      'getAllPromotion']
                                                                  [index]
                                                              ['hospitalId'] ==
                                                          promoResult[3]) {
                                                        for (var i = 0;
                                                            i <
                                                                result1
                                                                    .data![
                                                                        "getPromotionLog"]
                                                                    .length;
                                                            i++) {
                                                          if (result.data![
                                                                          'getAllPromotion']
                                                                      [index][
                                                                  'promotionId'] ==
                                                              result1.data![
                                                                      'getPromotionLog'][i]
                                                                  [
                                                                  'usedpromotionId']) {
                                                            x = x + 1;
                                                          }
                                                        }
                                                      }
                                                      if (x == 0 &&
                                                          result.data!['getAllPromotion']
                                                                      [index][
                                                                  'hospitalId'] ==
                                                              promoResult[3]) {
                                                        visible = true;
                                                      }

                                                      return Visibility(
                                                          visible: visible,
                                                          child: InkWell(
                                                              onTap: () {
                                                                Navigator
                                                                    .pushNamed(
                                                                  context,
                                                                  "/PromotionInHospitalDetail",
                                                                  arguments: [
                                                                    result.data!['getAllPromotion']
                                                                            [
                                                                            index]
                                                                        [
                                                                        'title'],
                                                                    result.data!['getAllPromotion']
                                                                            [
                                                                            index]
                                                                        [
                                                                        'hospitalDetail'],
                                                                    result.data!['getAllPromotion']
                                                                            [
                                                                            index]
                                                                        ['Url'],
                                                                    result.data!['getAllPromotion']
                                                                            [
                                                                            index]
                                                                        [
                                                                        'promotionId']
                                                                  ],
                                                                );
                                                              },
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.25,
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.9,
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            15),
                                                                    decoration: BoxDecoration(
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            color:
                                                                                Colors.grey.withOpacity(0.5),
                                                                            spreadRadius:
                                                                                2,
                                                                            blurRadius:
                                                                                5,
                                                                            offset:
                                                                                Offset(0, 3), // changes position of shadow
                                                                          ),
                                                                        ],
                                                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                        image: DecorationImage(
                                                                          image:
                                                                              NetworkImage(result.data!['getAllPromotion'][index]['Url']),
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        )),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 15,
                                                                  )
                                                                ],
                                                              )));
                                                    },
                                                    itemCount: result
                                                        .data![
                                                            'getAllPromotion']
                                                        .length,
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
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
