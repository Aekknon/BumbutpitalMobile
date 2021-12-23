import 'package:bumbutpital/Authentication/Login.dart';
import 'package:bumbutpital/ComponentMainScreen/bottom_navbar.dart';
import 'package:bumbutpital/Questionare/question_screen.dart';
import 'package:bumbutpital/services/graphql_config.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';

class MainQuestion extends StatefulWidget {
  MainQuestion({Key? key}) : super(key: key);

  @override
  _MainQuestionState createState() => _MainQuestionState();
}

class _MainQuestionState extends State<MainQuestion> {
  bool isChecked = false;
  static const query = """
                   query {
    getCurrentUser {
  appropiatePHQSeverity
  role


    }
  }
                  """;
  static const query1 = """
                   query {
    getCurrentUser {
    permissionPHQSeverity


    }
  }
                  """;

  static const permission = """
      
     mutation(\$permissionPHQSeverity: String! ){
  permissionphq9( permissionPHQSeverity:\$permissionPHQSeverity){
    successful
    message
  }
}
                        """;
  String data = '';
  bool checkedValue = false;
  fetchFileData() async {
    String responseText;
    responseText = await rootBundle.loadString('asset/text/consent.txt');
    setState(() {
      data = responseText;
    });
  }

  @override
  void initState() {
    fetchFileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return MaterialApp(
      title: "Main Question",
      home: Scaffold(
          backgroundColor: Color(0XFFECF2FF),
          body: Query(
            options: QueryOptions(document: gql(query1)),
            builder: (QueryResult result1, {fetchMore, refetch}) {
              if (result1.hasException) {
                return Text(result1.exception.toString());
              }
              if (result1.isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (result1.data == null) {
                return Text(result1.toString());
              }
              Future<void> onSubmit(RunMutation run) async {
                final response = run({
                  "permissionPHQSeverity": "yes",
                });
                print((await response.networkResult) as dynamic);

                Navigator.of(context).pop();
              }

              return Query(
                options: QueryOptions(document: gql(query)),
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
                  Future<void> onSubmit(RunMutation run) async {
                    try {
                      final response = run({
                        "permissionPHQSeverity": "yes",
                      });
                      print((await response.networkResult) as dynamic);

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainQuestion(),
                          ),
                          (route) => false);
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

                  bool visible1 = true;
                  bool visible2 = false;
                  bool visiblePageConsent = false;
                  bool visibleMainPage = true;
                  bool visibleMoph = false;
                  bool visibleUser = true;
                  if (result.data!['getCurrentUser'][0]['role'] == 'Ministry of Public Health Staff') {
                    visibleMoph = true;
                    visibleUser = false;
                  }
                  if (result.data!['getCurrentUser'][0]
                          ['appropiatePHQSeverity'] ==
                      null) {
                    visible1 = false;
                    visible2 = true;
                  }
                  if (result1.data!['getCurrentUser'][0]
                              ['permissionPHQSeverity'] ==
                          '' ||
                      result1.data!['getCurrentUser'][0]
                              ['permissionPHQSeverity'] ==
                          null) {
                    visibleMainPage = false;
                    visiblePageConsent = true;
                  }

                  return SafeArea(
                    child: Column(
                      children: [
                        Visibility(
                          visible: visiblePageConsent,
                          child: Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'asset/image/Bumbutpital Logo.png'))),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Visibility(
                                      visible: visibleUser,
                                      child: Column(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            child: Text(
                                              "You accept to give a permission for Bumbutpital application to collect your information",
                                              style: GoogleFonts.karla(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Divider(color: Colors.black),
                                          Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.6,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              child: Scrollbar(
                                                child: SingleChildScrollView(
                                                  child: Text(data,
                                                      style: GoogleFonts.karla(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 14)),
                                                ),
                                              )),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Spacer(),
                                              Mutation(
                                                options: MutationOptions(
                                                    document: gql(permission)),
                                                builder: (run, _) =>
                                                    ElevatedButton(
                                                  onPressed: () async {
                                                    await onSubmit(run);
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xff6367EA),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 50,
                                                            vertical: 15),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                  child: Text("Accept"),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              ElevatedButton(
                                                onPressed: () async {
                                                  // Navigator.push(context,
                                                  //     MaterialPageRoute(builder: (context) => ShowResult()));
                                                  await Provider.of<
                                                              GraphQLConfiguration>(
                                                          context,
                                                          listen: false)
                                                      .clearToken();
                                                  Navigator.pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              LoginPage()),
                                                      (route) => false);
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: Row(
                                                    children: [
                                                      Spacer(),
                                                      Text(
                                                        "No Accept",
                                                        style: GoogleFonts.karla(
                                                          fontSize: 15.0,
                                                          color: Color(
                                                              (0xff6367EA)),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                    ],
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.white,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 15),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          )
                                        ],
                                      )),
                                  Visibility(
                                      visible: visibleMoph,
                                      child: Column(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            child: Text(
                                              "You are Staff please Login in WebPage",
                                              style: GoogleFonts.karla(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Divider(color: Colors.black),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Spacer(),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              ElevatedButton(
                                                onPressed: () async {
                                                  // Navigator.push(context,
                                                  //     MaterialPageRoute(builder: (context) => ShowResult()));
                                                  await Provider.of<
                                                              GraphQLConfiguration>(
                                                          context,
                                                          listen: false)
                                                      .clearToken();
                                                  Navigator.pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              LoginPage()),
                                                      (route) => false);
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: Row(
                                                    children: [
                                                      Spacer(),
                                                      Text(
                                                        "No Accept",
                                                        style: GoogleFonts.karla(
                                                          fontSize: 15.0,
                                                          color: Color(
                                                              (0xff6367EA)),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                    ],
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.white,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 15),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),

                          // usually buttons at the bottom of the dialog
                        ),
                        Visibility(
                          visible: visibleMainPage,
                          child: Expanded(
                            child: SingleChildScrollView(
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 40),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          child: Image.asset(
                                              'asset/image/Bumbutpital Logo.png'),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text('BUMBUTPITAL',
                                            style: GoogleFonts.karla(
                                                fontWeight: FontWeight.normal)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Container(
                                      child: Text(
                                        'Welcome to BUMBUTPITAL',
                                        style: GoogleFonts.karla(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Container(
                                      child: Text(
                                        "Let's check your depression",
                                        style: GoogleFonts.karla(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 21,
                                    ),
                                    Container(
                                      child: Image.asset(
                                          'asset/image/MainQuestionPic.png'),
                                    ),
                                    SizedBox(
                                      height: 21,
                                    ),
                                    Row(
                                      children: [
                                        Spacer(),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Question()));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            primary: Color((0xff6367EA)),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 15),
                                          ),
                                          child: Text("GET STARTED"),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Visibility(
                                          visible: visible1,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          BottomNavBar()),
                                                  (route) => false);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              primary: Colors.white,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 40, vertical: 15),
                                            ),
                                            child: Text(
                                              "Skip",
                                              style: GoogleFonts.karla(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Color((0xff6367EA)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: visible2,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              primary: Colors.grey,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 40, vertical: 15),
                                            ),
                                            child: Text(
                                              "Skip",
                                              style: GoogleFonts.karla(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
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
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          )),
    );
  }
}
