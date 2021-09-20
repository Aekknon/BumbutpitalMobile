import 'package:bumbutpital/VideoPage/video_detail.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class VideotCard extends StatelessWidget {
  const VideotCard({Key? key}) : super(key: key);
  static const query = """
                   query   {
    getAllContent{
      contentID
       title
    description
    updateTime
    pictureUrl
    createAt
    appropiatePHQSeverity
    }
  }
                  """;

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(variables: {
          'vDepression': 'Depression',
        }, document: gql(query), pollInterval: Duration(seconds: 1)),
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
          return Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VideoDetail()));
                },
                child: Column(
                  children: [
                    Stack(children: [
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(30),
                              child: Image.network(
                                result.data!['getAllContent'][index]['pictureUrl'],
                                height: 100,
                                width: 150,
                              )),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,

                                  // transform:
                                  //     Matrix4.translationValues(
                                  //         -20, -30, 0.0),
                                  child: Text(
                                    'Topic: โรคภัยใกล้ตัว โรคซึมเศร้า',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Icon(Icons.schedule_outlined),
                                  alignment: Alignment.topLeft,
                                ),
                                Container(
                                    transform: Matrix4.translationValues(
                                        -30, -20, 0.0),
                                    child: Text('20 min')),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          );
              },
              itemCount: result.data!['getAllContent'].length,
            ))
          ],
        );
        });
  }
}

class VideotCard1 extends StatelessWidget {
  const VideotCard1({Key? key}) : super(key: key);
  static const query = """
                   query   {
    getAllContent{
      contentID
       title
    description
    updateTime
    pictureUrl
    createAt
    appropiatePHQSeverity
    }
  }
                  """;

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(variables: {
          'vDepression': 'Depression',
        }, document: gql(query), pollInterval: Duration(seconds: 1)),
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
          return Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VideoDetail()));
                },
                child: Column(
                  children: [
                    Stack(children: [
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(30),
                              child: Image.network(
                                result.data!['getAllContent'][index]['pictureUrl'],
                                height: 100,
                                width: 150,
                              )),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,

                                  // transform:
                                  //     Matrix4.translationValues(
                                  //         -20, -30, 0.0),
                                  child: Text(
                                    'Topic: โรคกลัวความมืด',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Icon(Icons.schedule_outlined),
                                  alignment: Alignment.topLeft,
                                ),
                                Container(
                                    transform: Matrix4.translationValues(
                                        -30, -20, 0.0),
                                    child: Text('20 min')),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          );
              },
              itemCount: result.data!['getAllContent'].length,
            ))
          ],
        );
        });
  }
}


class VideotCard2 extends StatelessWidget {
  const VideotCard2({Key? key}) : super(key: key);
  static const query = """
                   query   {
    getAllContent{
      contentID
       title
    description
    updateTime
    pictureUrl
    createAt
    appropiatePHQSeverity
    }
  }
                  """;

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(variables: {
          'vDepression': 'Depression',
        }, document: gql(query), pollInterval: Duration(seconds: 1)),
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
          return Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VideoDetail()));
                },
                child: Column(
                  children: [
                    Stack(children: [
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(30),
                              child: Image.network(
                                result.data!['getAllContent'][index]['pictureUrl'],
                                height: 100,
                                width: 150,
                              )),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,

                                  // transform:
                                  //     Matrix4.translationValues(
                                  //         -20, -30, 0.0),
                                  child: Text(
                                    'Topic: โรคซึมเศร้า',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Icon(Icons.schedule_outlined),
                                  alignment: Alignment.topLeft,
                                ),
                                Container(
                                    transform: Matrix4.translationValues(
                                        -30, -20, 0.0),
                                    child: Text('20 min')),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          );
              },
              itemCount: result.data!['getAllContent'].length,
            ))
          ],
        );
        });
  }
}



