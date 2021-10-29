import 'package:bumbutpital/HospitalPage/qr_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:bumbutpital/HospitalPage/promotion_screen.dart';

class KeepkoopongPage extends StatefulWidget {
  const KeepkoopongPage({Key? key}) : super(key: key);

  @override
  _KeepkoopongPageState createState() => _KeepkoopongPageState();
}

class _KeepkoopongPageState extends State<KeepkoopongPage> {
  bool visible = true;
  bool visible2 = false;

  static const usedpromotion = """
      
     mutation(\$promotion: String! , \$usedpromotion: String! , \$status: String!){
  keepPromotion( keeppromotionId:\$promotion  , usedpromotionId: \$usedpromotion, status: \$status){
    keeppromotionId
    usedpromotionId
    status
  }
}
                        """;
  static const query = """
                    query {
    getPromotionLog{
      userId
      usedpromotionId
      keeppromotionId
      status
      

    }
  }                """;

  @override
  Widget build(BuildContext context) {
    List<dynamic> promotiondata =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
        String QRdata = promotiondata[0];
    Future<void> onSubmit(RunMutation run) async {
      try {
        final response = run({
          "promotion": promotiondata[3],
          "usedpromotion": "",
          "status": "not use"
        });
        print((await response.networkResult) as dynamic);

        Navigator.of(context).pop();
      } catch (err) {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error!'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Insert your Question'),
                  ],
                ),
              ),
            );
          },
        );
      }
    }

    Future<void> onSubmit1(RunMutation run) async {
      try {
        final response = run({
          "promotion": "",
          "usedpromotion": promotiondata[3],
          "status": "use"
        });
        print((await response.networkResult) as dynamic);

        Navigator.pushNamed(
          context,
          "/QRCodePage",
          arguments: [QRdata],
        );
      } catch (err) {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error!'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Insert your Question'),
                  ],
                ),
              ),
            );
          },
        );
      }
    }

    
    print(QRdata);

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Color(0xffECF2FF),
          elevation: 0,
        ),
        body: Query(
          options: QueryOptions(
              document: gql(query), pollInterval: Duration(seconds: 1)),
          builder: (QueryResult result, {fetchMore, refetch}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }
            if (result.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (result.data == null) {
              return Text(result.toString());
            }
            bool x = true;
            bool y = true;
            for (var i = 0; i < result.data!['getPromotionLog'].length; i++) {
              if (result.data!['getPromotionLog'][i]['keeppromotionId'] ==
                  promotiondata[3]) {
                x = false;
              }
            }
            for (var i = 0; i < result.data!['getPromotionLog'].length; i++) {
              if (result.data!['getPromotionLog'][i]['usedpromotionId'] ==
                  promotiondata[3]) {
                y = false;
              }
            }
            if (y == false) {
              visible = false;
              visible2 = true;
            } else {
              visible = true;
              visible2 = false;
            }
            if (x == false) {
              visible = false;
              visible2 = true;
            } else {
              visible = true;
              visible2 = false;
            }
            return Container(
              color: Color(0XFFECF2FF),
              height: MediaQuery.of(context).size.height,
              child: Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.8,
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
                                image: NetworkImage(promotiondata[2]),
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          promotiondata[0],
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: Color(0XFF6367EA),
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
                            child: Center(
                              child: Text(
                                promotiondata[3],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'เงื่อนไขการใช้งาน',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            promotiondata[1],
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Visibility(
                              visible: visible,
                              child: Mutation(
                                options: MutationOptions(
                                    document: gql(usedpromotion)),
                                builder: (run, _) => ElevatedButton(
                                  onPressed: () async {
                                    await onSubmit(run);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Color((0xff6367EA)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15),
                                  ),
                                  child: Text("Keep Promorion"),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: visible2,
                              child: ElevatedButton(
                                onPressed: () async {},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.grey,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 15),
                                ),
                                child: Text("Keep Promorion"),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  "/QRCodePage",
                                  arguments: [QRdata],
                                );
                              },
                              child: Mutation(
                                options: MutationOptions(
                                    document: gql(usedpromotion)),
                                builder: (run, _) => ElevatedButton(
                                  onPressed: () async {
                                    await onSubmit1(run);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Color((0xff6367EA)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15),
                                  ),
                                  child: Text("Use Promorion"),
                                ),
                              ),
                            ),
                            Spacer(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}

class KeepCurrentKoopongPage extends StatefulWidget {
  KeepCurrentKoopongPage({Key? key}) : super(key: key);

  @override
  _KeepCurrentKoopongPageState createState() => _KeepCurrentKoopongPageState();
}

class _KeepCurrentKoopongPageState extends State<KeepCurrentKoopongPage> {
  static const usedpromotion = """
      
     mutation(\$promotion: String! , \$usedpromotion: String! , \$status: String!){
  keepPromotion( keeppromotionId:\$promotion  , usedpromotionId: \$usedpromotion, status: \$status){
    keeppromotionId
    usedpromotionId
    status
  }
}
                        """;

  static const query = """
                    query {
    getCurrentPromotion{
      promotionId
      hospitalId
      title
      hospitalDetail
      couponCode
      Url
      expiredDate

    }
  }                """;

  @override
  Widget build(BuildContext context) {
    List<dynamic> promotiondata =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
         String QRdata = promotiondata[0];
    Future<void> onSubmit(RunMutation run) async {
      try {
        final response = run({
          "promotion": "",
          "usedpromotion": promotiondata[3],
          "status": "use"
        });
        print((await response.networkResult) as dynamic);

        Navigator.pushNamed(
                              context,
                              "/QRCodePage",
                              arguments: [QRdata[0]],
                            );
      } catch (err) {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error!'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Insert your Question'),
                  ],
                ),
              ),
            );
          },
        );
      }
    }

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Color(0xffECF2FF),
          elevation: 0,
        ),
        body: Container(
          color: Color(0XFFECF2FF),
          height: MediaQuery.of(context).size.height,
          child: Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: NetworkImage(promotiondata[2]),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      promotiondata[0],
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Color(0XFF6367EA),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: Text(
                            promotiondata[3],
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'เงื่อนไขการใช้งาน',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        promotiondata[1],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        InkWell(
                          onTap: () {
                           
                          },
                          child: Mutation(
                            options:
                                MutationOptions(document: gql(usedpromotion)),
                            builder: (run, _) => ElevatedButton(
                              onPressed: () async {
                                await onSubmit(run);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color((0xff6367EA)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 15),
                              ),
                              child: Text("Use Promorion"),
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
