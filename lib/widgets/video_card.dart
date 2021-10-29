import 'package:bumbutpital/VideoPage/video_detail.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class VideotCard extends StatelessWidget {
  const VideotCard({Key? key}) : super(key: key);
  static const query = """
                    query {
    getMinimalVideo{
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
                              result.data!['getMinimalVideo'][index]['title'],
                              result.data!['getMinimalVideo'][index]['videoUrl'],
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
                                        result.data!['getMinimalVideo'][index]
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
                                                result.data!['getMinimalVideo']
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
                itemCount: result.data!['getMinimalVideo'].length,
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
    getMildVideo{
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
                              result.data!['getMildVideo'][index]['title'],
                              result.data!['getMildVideo'][index]['videoUrl'],
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
                                        result.data!['getMildVideo'][index]
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
                                                result.data!['getMildVideo']
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
                itemCount: result.data!['getMildVideo'].length,
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
    getModerateVideo{
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
                              result.data!['getModerateVideo'][index]['title'],
                              result.data!['getModerateVideo'][index]['videoUrl'],
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
                                        result.data!['getModerateVideo'][index]
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
                                                result.data!['getModerateVideo']
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
                itemCount: result.data!['getModerateVideo'].length,
              ))
            ],
          );
        });
  }
}

class VideotCard3 extends StatelessWidget {
  const VideotCard3({Key? key}) : super(key: key);
  static const query = """
                    query {
    getModeratelySeverVideo{
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
                              result.data!['getModeratelySeverVideo'][index]['title'],
                              result.data!['getModeratelySeverVideo'][index]['videoUrl'],
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
                                        result.data!['getModeratelySeverVideo'][index]
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
                                                result.data!['getModeratelySeverVideo']
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
                itemCount: result.data!['getModeratelySeverVideo'].length,
              ))
            ],
          );
        });
  }
}

class VideotCard4 extends StatelessWidget {
  const VideotCard4({Key? key}) : super(key: key);
  static const query = """
                    query {
    getSevereVideo{
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
                              result.data!['getSevereVideo'][index]['title'],
                              result.data!['getSevereVideo'][index]['videoUrl'],
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
                                        result.data!['getSevereVideo'][index]
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
                                                result.data!['getSevereVideo']
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
                itemCount: result.data!['getSevereVideo'].length,
              ))
            ],
          );
        });
  }
}

class VideotCard5 extends StatelessWidget {
  const VideotCard5({Key? key}) : super(key: key);
  static const query = """
                    query {
    getSmartVideo{
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
                              result.data!['getSmartVideo'][index]['title'],
                              result.data!['getSmartVideo'][index]['videoUrl'],
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
                                        result.data!['getSmartVideo'][index]
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
                                                result.data!['getSmartVideo']
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
                itemCount: result.data!['getSmartVideo'].length,
              ))
            ],
          );
        });
  }
}



