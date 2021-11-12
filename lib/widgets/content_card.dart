import 'package:bumbutpital/ContentPage/content_detail.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({Key? key}) : super(key: key);

  static const query = """
                   query {
    getMinimalContent {
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
        final content = result.data!['getMinimalContent'];
        return Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                   int reverseIndex = result.data!['getMinimalContent'].length - 1 - index;
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/ContentDetail",
                          arguments: [
                            result.data!['getMinimalContent'][reverseIndex]
                                ['pictureUrl'],
                            result.data!['getMinimalContent'][reverseIndex]['title'],
                            result.data!['getMinimalContent'][reverseIndex]
                                ['description'],
                            result.data!['getMinimalContent'][reverseIndex]['createAt']
                          ],
                        );
                      },
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.all(20),
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
                              image: NetworkImage(
                                  result.data!['getMinimalContent'][reverseIndex]
                                      ['pictureUrl']),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                );
              },
              itemCount: result.data!['getMinimalContent'].length,
            )),
          ],
        );
      },
    );
  }
}

class ContentCard1 extends StatelessWidget {
  const ContentCard1({Key? key}) : super(key: key);
  static const query = """
                   query {
    getMildContent {
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
        final content = result.data!['getMildContent'];
        return Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                int reverseIndex = result.data!['getMildContent'].length - 1 - index;
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/ContentDetail",
                          arguments: [
                            result.data!['getMildContent'][reverseIndex]['pictureUrl'],
                            result.data!['getMildContent'][reverseIndex]['title'],
                            result.data!['getMildContent'][reverseIndex]
                                ['description'],
                            result.data!['getMildContent'][reverseIndex]['createAt']
                          ],
                        );
                      },
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.all(20),
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
                              image: NetworkImage(result.data!['getMildContent']
                                  [reverseIndex]['pictureUrl']),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                );
              },
              itemCount: result.data!['getMildContent'].length,
            )),
          ],
        );
      },
    );
  }
}

class ContentCard2 extends StatelessWidget {
  const ContentCard2({Key? key}) : super(key: key);
  static const query = """
                   query {
    getModerateContent {
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
        final content = result.data!['getModerateContent'];
        return Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                int reverseIndex = result.data!['getModerateContent'].length - 1 - index;
                
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/ContentDetail",
                          arguments: [
                            result.data!['getModerateContent'][reverseIndex]
                                ['pictureUrl'],
                            result.data!['getModerateContent'][reverseIndex]['title'],
                            result.data!['getModerateContent'][reverseIndex]
                                ['description'],
                            result.data!['getModerateContent'][reverseIndex]
                                ['createAt']
                          ],
                        );
                      },
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.all(20),
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
                              image: NetworkImage(
                                  result.data!['getModerateContent'][reverseIndex]
                                      ['pictureUrl']),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                );
              },
              itemCount: result.data!['getModerateContent'].length,
            )),
          ],
        );
      },
    );
  }
}

class ContentCard3 extends StatelessWidget {
  const ContentCard3({Key? key}) : super(key: key);
  static const query = """
                   query {
    getModeratelySeverContent {
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
        final content = result.data!['getModeratelySeverContent'];
        return Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                int reverseIndex = result.data!['getModerateContent'].length - 1 - index;
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/ContentDetail",
                          arguments: [
                            result.data!['getModeratelySeverContent'][reverseIndex]
                                ['pictureUrl'],
                            result.data!['getModeratelySeverContent'][reverseIndex]
                                ['title'],
                            result.data!['getModeratelySeverContent'][reverseIndex]
                                ['description'],
                            result.data!['getModeratelySeverContent'][reverseIndex]
                                ['createAt']
                          ],
                        );
                      },
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.all(20),
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
                              image: NetworkImage(
                                  result.data!['getModeratelySeverContent']
                                      [reverseIndex]['pictureUrl']),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                );
              },
              itemCount: result.data!['getModeratelySeverContent'].length,
            )),
          ],
        );
      },
    );
  }
}

class ContentCard4 extends StatelessWidget {
  const ContentCard4({Key? key}) : super(key: key);
  static const query = """
                   query {
    getSevereContent {
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
        final content = result.data!['getSevereContent'];
        return Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                int reverseIndex = result.data!['getSevereContent'].length - 1 - index;
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/ContentDetail",
                          arguments: [
                            result.data!['getSevereContent'][reverseIndex]
                                ['pictureUrl'],
                            result.data!['getSevereContent'][reverseIndex]['title'],
                            result.data!['getSevereContent'][reverseIndex]
                                ['description'],
                            result.data!['getSevereContent'][reverseIndex]['createAt']
                          ],
                        );
                      },
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.all(20),
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
                              image: NetworkImage(
                                  result.data!['getSevereContent'][reverseIndex]
                                      ['pictureUrl']),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                );
              },
              itemCount: result.data!['getSevereContent'].length,
            )),
          ],
        );
      },
    );
  }
}

class ContentCard5 extends StatelessWidget {
  const ContentCard5({Key? key}) : super(key: key);
  static const query = """
                   query {
    getSmartContent {
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
        final content = result.data!['getSmartContent'];
        return Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                 int reverseIndex = result.data!['getSmartContent'].length - 1 - index;
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/ContentDetail",
                          arguments: [
                            result.data!['getSmartContent'][reverseIndex]
                                ['pictureUrl'],
                            result.data!['getSmartContent'][reverseIndex]['title'],
                            result.data!['getSmartContent'][reverseIndex]
                                ['description'],
                            result.data!['getSmartContent'][reverseIndex]['createAt']
                          ],
                        );
                      },
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.all(20),
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
                              image: NetworkImage(
                                  result.data!['getSmartContent'][reverseIndex]
                                      ['pictureUrl']),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                );
              },
              itemCount: result.data!['getSmartContent'].length,
            )),
          ],
        );
      },
    );
  }
}
