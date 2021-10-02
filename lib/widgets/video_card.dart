import 'package:bumbutpital/VideoPage/video_detail.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class VideotCard extends StatelessWidget {
  const VideotCard({Key? key}) : super(key: key);
  static const query = """
                    query {
    getAllVideo{
      videoID
      staffID
      appropiatePHQSeverity
      title
      pictureUrl
      createAt
      videoUrl
      
      
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
                          Navigator.pushNamed(
                            context,
                            "/VideoDetail",
                            arguments: [
                              result.data!['getAllVideo'][index]['title'],
                              result.data!['getAllVideo'][index]['videoUrl'],
                            ],
                          );
                        },
                        child: Column(
                          children: [
                            Stack(children: [
                              Row(
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 30,
                                          right: 30,
                                          top: 10,
                                          bottom: 5),
                                      child: Image.network(
                                        result.data!['getAllVideo'][index]
                                            ['pictureUrl'],
                                        height: 100,
                                        width: 150,
                                      )),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,

                                          // transform:
                                          //     Matrix4.translationValues(
                                          //         -20, -30, 0.0),
                                          child: Text(
                                            'Topic:' +
                                                result.data!['getAllVideo']
                                                    [index]['title'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          child: Icon(Icons.schedule_outlined),
                                          alignment: Alignment.topLeft,
                                        ),
                                        Container(
                                            transform:
                                                Matrix4.translationValues(
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
                    ],
                  );
                },
                itemCount: result.data!['getAllVideo'].length,
              ))
            ],
          );
        });
  }
}

class VideotCard1 extends StatelessWidget {
  const VideotCard1({Key? key}) : super(key: key);
  static const query = """
                   query {
    getAllVideo{
      videoID
      staffID
      appropiatePHQSeverity
      title
      pictureUrl
      createAt
      videoUrl
      
      
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
                          Navigator.pushNamed(
                            context,
                            "/VideoDetail",
                            arguments: [
                              result.data!['getAllVideo'][index]['title'],
                              result.data!['getAllVideo'][index]['videoUrl'],
                            ],
                          );
                        },
                        child: Column(
                          children: [
                            Stack(children: [
                              Row(
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 30,
                                          right: 30,
                                          top: 10,
                                          bottom: 5),
                                      child: Image.network(
                                        result.data!['getAllVideo'][index]
                                            ['pictureUrl'],
                                        height: 100,
                                        width: 150,
                                      )),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,

                                          // transform:
                                          //     Matrix4.translationValues(
                                          //         -20, -30, 0.0),
                                          child: Text(
                                            'Topic:' +
                                                result.data!['getAllVideo']
                                                    [index]['title'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          child: Icon(Icons.schedule_outlined),
                                          alignment: Alignment.topLeft,
                                        ),
                                        Container(
                                            transform:
                                                Matrix4.translationValues(
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
                    ],
                  );
                },
                itemCount: result.data!['getAllVideo'].length,
              ))
            ],
          );
        });
  }
}

class VideotCard2 extends StatelessWidget {
  const VideotCard2({Key? key}) : super(key: key);
  static const query = """
                   query {
    getAllVideo{
      videoID
      staffID
      appropiatePHQSeverity
      title
      pictureUrl
      createAt
      videoUrl
      
      
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
                          Navigator.pushNamed(
                            context,
                            "/VideoDetail",
                            arguments: [
                              result.data!['getAllVideo'][index]['title'],
                              result.data!['getAllVideo'][index]['videoUrl'],
                            ],
                          );
                        },
                        child: Column(
                          children: [
                            Stack(children: [
                              Row(
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 30,
                                          right: 30,
                                          top: 10,
                                          bottom: 5),
                                      child: Image.network(
                                        result.data!['getAllVideo'][index]
                                            ['pictureUrl'],
                                        height: 100,
                                        width: 150,
                                      )),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,

                                          // transform:
                                          //     Matrix4.translationValues(
                                          //         -20, -30, 0.0),
                                          child: Text(
                                            'Topic:' +
                                                result.data!['getAllVideo']
                                                    [index]['title'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          child: Icon(Icons.schedule_outlined),
                                          alignment: Alignment.topLeft,
                                        ),
                                        Container(
                                            transform:
                                                Matrix4.translationValues(
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
                    ],
                  );
                },
                itemCount: result.data!['getAllVideo'].length,
              ))
            ],
          );
        });
  }
}
