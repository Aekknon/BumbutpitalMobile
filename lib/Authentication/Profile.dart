// ignore_for_file: avoid_print, file_names, use_key_in_widget_constructors

import 'package:bumbutpital/Authentication/Login.dart';
import 'package:bumbutpital/Questionare/show_result.dart';
import 'package:bumbutpital/services/graphql_config.dart';
import 'package:bumbutpital/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'edit_profile.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  // ignore: non_constant_identifier_names


  static const query = """
                   query {
    getCurrentUser {
     
       name
    surname
    email
    phoneNumber
    appropiatePHQSeverity
    }
  }
                  """;

  static const mutation = """
      
     mutation( \$appropiatePHQSeverity: String!){
  phq9permission(  appropiatePHQSeverity: \$appropiatePHQSeverity){
    successful
    message
  }
}
                        """;

  static const query1 = """
      
   query{
    getcurrentForum{
     title
    description
    answer
  }
}

                        """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFECF2FF),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0XFFECF2FF),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "My Profile",
            style: TextStyle(color: Colors.black),
          ),
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
            final Phq9Score =
                result.data!['getCurrentUser'][0]['appropiatePHQSeverity'];
            Future<void> onSubmit(RunMutation run) async {
              try {
                final response = run({
                  "_phq9permission": "y",
                  "appropiatePHQSeverity": Phq9Score
                });
                print((await response.networkResult) as dynamic);

                Navigator.pop(context, 'OK');
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
                final response =
                    run({"_phq9permission": "n", "appropiatePHQSeverity": ""});
                print((await response.networkResult) as dynamic);

                Navigator.pop(context, 'OK');
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

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfile()));
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6yT-obMdemGbSctinso7rd-tJGyxHhnxetinsg4Nwj2Va1nbirK_lT9wy2KEqIiAMjkw&usqp=CAU'),
                      radius: 60,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          Text(
                            result.data!['getCurrentUser'][0]['name'] +
                                " " +
                                result.data!['getCurrentUser'][0]['surname'],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditProfile()));
                              },
                              child: Icon(
                                Icons.edit,
                                color: Color(0xff706A6A),
                              )),
                              Spacer(),
                        ],
                      ),
                    ],
                  )),
                  SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 22.0),
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "My Question",
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Query(
                                      options: QueryOptions(
                                          document: gql(query1),
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

                                        return Text(
                                          result.data!['getcurrentForum'].length
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "My Promotion",
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "2",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "My Diary",
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "10",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 22.0),
                      child: Row(
                        children: <Widget>[
                         
                          Expanded(
                            child: Row(children: [
                               Spacer(),
                              Column(
                              children: <Widget>[
                                Text(
                                  "My PHQ-9 Severity",
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  result.data!['getCurrentUser'][0]
                                      ['appropiatePHQSeverity'],
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ), Spacer(),
                            ],)
                          ),
                          
                        
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => ShowResult()));
                      await Provider.of<GraphQLConfiguration>(context,
                              listen: false)
                          .clearToken();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                          (route) => false);
                    },
                    child: Text("LOGOUT"),
                    style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        primary: Color(0XFFFE7940)),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
