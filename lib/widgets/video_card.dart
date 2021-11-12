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
                  int reverseIndex = result.data!['getMinimalVideo'].length - 1 - index;
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/VideoDetail",
                            arguments: [
                              result.data!['getMinimalVideo'][reverseIndex]['title'],
                              result.data!['getMinimalVideo'][reverseIndex]['videoUrl'],
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
                                        result.data!['getMinimalVideo'][reverseIndex]
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
                                                    [reverseIndex]['title'],
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
                  int reverseIndex = result.data!['getMildVideo'].length - 1 - index;
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/VideoDetail",
                            arguments: [
                              result.data!['getMildVideo'][reverseIndex]['title'],
                              result.data!['getMildVideo'][reverseIndex]['videoUrl'],
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
                                        result.data!['getMildVideo'][reverseIndex]
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
                                                    [reverseIndex]['title'],
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
                  int reverseIndex = result.data!['getModerateVideo'].length - 1 - index;
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/VideoDetail",
                            arguments: [
                              result.data!['getModerateVideo'][reverseIndex]['title'],
                              result.data!['getModerateVideo'][reverseIndex]['videoUrl'],
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
                                        result.data!['getModerateVideo'][reverseIndex]
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
                                                    [reverseIndex]['title'],
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
                  int reverseIndex = result.data!['getModeratelySeverVideo'].length - 1 - index;
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/VideoDetail",
                            arguments: [
                              result.data!['getModeratelySeverVideo'][reverseIndex]['title'],
                              result.data!['getModeratelySeverVideo'][reverseIndex]['videoUrl'],
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
                                        result.data!['getModeratelySeverVideo'][reverseIndex]
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
                                                    [reverseIndex]['title'],
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
                  int reverseIndex = result.data!['getSevereVideo'].length - 1 - index;
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/VideoDetail",
                            arguments: [
                              result.data!['getSevereVideo'][reverseIndex]['title'],
                              result.data!['getSevereVideo'][reverseIndex]['videoUrl'],
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
                                        result.data!['getSevereVideo'][reverseIndex]
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
                                                    [reverseIndex]['title'],
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
                   int reverseIndex = result.data!['getSmartVideo'].length - 1 - index;
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/VideoDetail",
                            arguments: [
                              result.data!['getSmartVideo'][reverseIndex]['title'],
                              result.data!['getSmartVideo'][reverseIndex]['videoUrl'],
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
                                        result.data!['getSmartVideo'][reverseIndex]
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
                                                    [reverseIndex]['title'],
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



