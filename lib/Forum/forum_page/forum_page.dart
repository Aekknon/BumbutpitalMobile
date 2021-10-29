import 'package:bumbutpital/ContentPage/content_detail.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AllForum extends StatelessWidget {
  const AllForum({Key? key}) : super(key: key);
    static const query = """
      
   query{
    getAllForum{
     title
    description
    answer
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
        return Column(
          children: [
            Expanded(
                    child: ListView.builder(
                      reverse: true,
                       shrinkWrap: true,
                        itemCount: result.data!['getAllForum'].length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Center(
                                child: Column(
                                  children: [
                                   
                                    Container(
                                      width: MediaQuery.of(context).size.width*0.7,
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
                                              width: MediaQuery.of(context).size.width*0.7,
                                              decoration: BoxDecoration(
                                                color: Color(0xff6367EA),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  topRight: Radius.circular(12),
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    result.data!['getAllForum']
                                                        [index]['title'],
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              )),
                                          Container(
                                            width: MediaQuery.of(context).size.width*0.8,
                                            color: Colors.white,
                                            padding: const EdgeInsets.only(
                                                top: 10,
                                                bottom: 10,
                                                left: 30,
                                                right: 10),
                                            child: Text(
                                              result.data!['getAllForum'][index]
                                                  ['description'],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                          ),
                                          if (result.data!['getAllForum'][index]
                                                  ['answer'] !=
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
                                                      result.data![
                                                              'getAllForum']
                                                          [index]['answer'],
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
                                                      'Dr. WIsa Moolhom',
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
                              SizedBox(height: MediaQuery.of(context).size.height*0.08,)
                            ],
                          );
                        }),
                  ),
            
            
          ],
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
    description
    answer
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
        return Column(
          children: [
            Expanded(
                    child: ListView.builder(
                      reverse: true,
                       shrinkWrap: true,
                        itemCount: result.data!['getcurrentForum'].length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Center(
                                child: Column(
                                  children: [
                                   
                                    Container(
                                      width: MediaQuery.of(context).size.width*0.7,
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
                                              width: MediaQuery.of(context).size.width*0.7,
                                              decoration: BoxDecoration(
                                                color: Color(0xff6367EA),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  topRight: Radius.circular(12),
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    result.data!['getcurrentForum']
                                                        [index]['title'],
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              )),
                                          Container(
                                            width: MediaQuery.of(context).size.width*0.8,
                                            color: Colors.white,
                                            padding: const EdgeInsets.only(
                                                top: 10,
                                                bottom: 10,
                                                left: 30,
                                                right: 10),
                                            child: Text(
                                              result.data!['getcurrentForum'][index]
                                                  ['description'],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                          ),
                                          if (result.data!['getcurrentForum'][index]
                                                  ['answer'] !=
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
                                                      result.data![
                                                              'getcurrentForum']
                                                          [index]['answer'],
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
                                                      'Dr. WIsa Moolhom',
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
                              SizedBox(height: MediaQuery.of(context).size.height*0.08,)
                            ],
                          );
                        }),
                  ),
            
            
          ],
        );
      },
    );
  }
}