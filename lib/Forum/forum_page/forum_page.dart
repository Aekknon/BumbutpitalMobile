import 'package:bumbutpital/ContentPage/content_detail.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AllForum extends StatelessWidget {
  const AllForum({Key? key}) : super(key: key);
  static const query = """
      
   query{
    getAllForum{
     title
     staffID
    description
    answer
  }
}

                        """;
  static const query1 = """
                   query {
    getAllUsers {
     id
       name
    surname
    email
    phoneNumber
    appropiatePHQSeverity
    appropiatePHQSeverityScore
    }
  }
                  """;

  @override
  Widget build(BuildContext context) {
    return Query(
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

        final content = result.data!['getAllForum'];
        return Query(
          options: QueryOptions(
              document: gql(query1), pollInterval: Duration(seconds: 1)),
          builder: (QueryResult result1, {fetchMore, refetch}) {
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

            final content = result.data!['getAllForum'];
            return Column(
              children: [
                Expanded(
                    child: Scrollbar(
                  isAlwaysShown: true,
                  showTrackOnHover: true,
                  child: ListView.builder(
                      itemCount: result.data!['getAllForum'].length,
                      itemBuilder: (BuildContext context, int index) {
                        int reverseIndex =
                            result.data!['getAllForum'].length - 1 - index;
                        String StaffName = '';
                        for (var i = 0;
                            i < result1.data!['getAllUsers'].length;
                            i++) {
                          if (result.data!['getAllForum'][reverseIndex]
                                  ['staffID'] ==
                              result1.data!['getAllUsers'][i]['id']) {
                            StaffName = result1.data!['getAllUsers'][i]['name']
                                    .toString() +
                                result1.data!['getAllUsers'][i]['surname']
                                    .toString();
                          }
                        }
                        return Column(
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                          bottomRight: Radius.circular(12)),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                            decoration: BoxDecoration(
                                              color: Color(0xff6367EA),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(15),
                                                  child: Text(
                                                    result.data!['getAllForum']
                                                        [reverseIndex]['title'],
                                                    style: GoogleFonts.karla(
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            )),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          color: Colors.white,
                                          padding: const EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 10,
                                              right: 10),
                                          child: Text(
                                            result.data!['getAllForum']
                                                [reverseIndex]['description'],
                                            style: GoogleFonts.karla(
                                                fontSize: 16,
                                                color: Colors.black,
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                        ),
                                        if (result.data!['getAllForum']
                                                [reverseIndex]['answer'] !=
                                            null)
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  top: 10,
                                                  bottom: 5,
                                                  left: 10,
                                                  right: 10),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    result.data!['getAllForum']
                                                            [reverseIndex]
                                                        ['answer'],
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    StaffName,
                                                    style: TextStyle(
                                                        fontSize: 8,
                                                        color: Colors.black,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ],
                                              ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.08,
                            )
                          ],
                        );
                      }),
                )),
              ],
            );
          },
        );
      },
    );
  }
}

class MyForum extends StatelessWidget {
  const MyForum({Key? key}) : super(key: key);
  static const query = """
      
   query{
    getcurrentForum{
     title
     staffID
    description
    answer
  }
}

                        """;
  static const query1 = """
                   query {
    getAllUsers {
     id
       name
    surname
    email
    phoneNumber
    appropiatePHQSeverity
    appropiatePHQSeverityScore
    }
  }
                  """;

  @override
  Widget build(BuildContext context) {
    return Query(
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
        final content = result.data!['getcurrentForum'];

        return Query(
          options: QueryOptions(
              document: gql(query1), pollInterval: Duration(seconds: 1)),
          builder: (QueryResult result1, {fetchMore, refetch}) {
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
            final content = result.data!['getcurrentForum'];

            return Column(
              children: [
                Expanded(
                    child: Scrollbar(
                  isAlwaysShown: true,
                  showTrackOnHover: true,
                  child: ListView.builder(
                      itemCount: result.data!['getcurrentForum'].length,
                      itemBuilder: (BuildContext context, int index) {
                        int reverseIndex =
                            result.data!['getcurrentForum'].length - 1 - index;
                        String StaffName = '';
                        for (var i = 0;
                            i < result1.data!['getAllUsers'].length;
                            i++) {
                          if (result.data!['getcurrentForum'][reverseIndex]
                                  ['staffID'] ==
                              result1.data!['getAllUsers'][i]['id']) {
                            StaffName = result1.data!['getAllUsers'][i]['name']
                                    .toString() +
                                result1.data!['getAllUsers'][i]['surname']
                                    .toString();
                          }
                        }
                        return Column(
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                          bottomRight: Radius.circular(12)),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                            decoration: BoxDecoration(
                                              color: Color(0xff6367EA),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(15),
                                                  child: Text(
                                                    result.data!['getcurrentForum']
                                                        [reverseIndex]['title'],
                                                    style: GoogleFonts.karla(
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            )),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          color: Colors.white,
                                          padding: const EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 10,
                                              right: 10),
                                          child: Text(
                                            result.data!['getcurrentForum']
                                                [reverseIndex]['description'],
                                            style: GoogleFonts.karla(
                                                fontSize: 16,
                                                color: Colors.black,
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                        ),
                                        if (result.data!['getcurrentForum']
                                                [reverseIndex]['answer'] !=
                                            null)
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  top: 10,
                                                  bottom: 5,
                                                  left: 10,
                                                  right: 10),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    result.data!['getcurrentForum']
                                                            [reverseIndex]
                                                        ['answer'],
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    StaffName,
                                                    style: TextStyle(
                                                        fontSize: 8,
                                                        color: Colors.black,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ],
                                              ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.08,
                            )
                          ],
                        );
                      }),
                )),
              ],
            );
          },
        );
      },
    );
  }
}
