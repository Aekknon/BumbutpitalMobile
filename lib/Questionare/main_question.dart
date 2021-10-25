import 'package:bumbutpital/Questionare/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:bumbutpital/ComponentMainScreen/bottom_navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class MainQuestion extends StatelessWidget {
  static const query = """
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
                        

  @override
  Widget build(BuildContext context) {
    Future<String> loadAsset(BuildContext context) async {
  return await DefaultAssetBundle.of(context).loadString('asset/text/consent.txt');
}
    return MaterialApp(
      title: "Main Question",
      home: Scaffold(
          backgroundColor: Color(0XFFECF2FF),
          body: Query(
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

              if (result.data!['getCurrentUser'][0]['permissionPHQSeverity'] ==
                  '') {
                Future.delayed(
                    Duration(seconds: 0),
                    () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // return object of type Dialog
                            return AlertDialog(
                              title: Column(
                                children: [
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
                                  Text(
                                      "You accept to give a permission for Bumbutpital application to collect your information"),
                                  Divider(color: Colors.black),
                                ],
                              ),
                              content: Center(
                                child: Column(
                                  children: [
                                    Text(
                                        "This is one time dialogaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"),
                                    Text(
                                        "This is one time dialogaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                // usually buttons at the bottom of the dialog
                                Mutation(
                                  options: MutationOptions(
                                      document: gql(permission)),
                                  builder: (run, _) => ElevatedButton(
                                    onPressed: () async {
                                      await onSubmit(run);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0XFFFE7940),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 50, vertical: 15),
                                    ),
                                    child: Text("Accept"),
                                  ),
                                )
                              ],
                            );
                          },
                        ));
              }

              return SafeArea(
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                style:
                                    TextStyle(fontWeight: FontWeight.normal)),
                          ],
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Container(
                          child: Text(
                            'Welcome to BUMBUTPITAL',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Container(
                          child: Text(
                            "Let's check your depression",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 21,
                        ),
                        Container(
                          child: Image.asset('asset/image/MainQuestionPic.png'),
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
                                        builder: (context) => Question()));
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                primary: Color(0XFFFE7940),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 15),
                              ),
                              child: Text("GET STARTED"),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BottomNavBar()));
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                primary: Color(0xFF7B8CE4),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 15),
                              ),
                              child: Text("Skip"),
                            ),
                            Spacer(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
