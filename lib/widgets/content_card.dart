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
                return Column(
                  children: [
                    
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/ContentDetail",
                          arguments: [
                            result.data!['getMinimalContent'][index]
                                ['pictureUrl'],
                            result.data!['getMinimalContent'][index]['title'],
                            result.data!['getMinimalContent'][index]
                                ['description'],
                            result.data!['getMinimalContent'][index]['createAt']
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
                                  result.data!['getMinimalContent'][index]
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
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/ContentDetail",
                          arguments: [
                            result.data!['getMildContent'][index]['pictureUrl'],
                            result.data!['getMildContent'][index]['title'],
                            result.data!['getMildContent'][index]
                                ['description'],
                            result.data!['getMildContent'][index]['createAt']
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
                                  [index]['pictureUrl']),
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
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/ContentDetail",
                          arguments: [
                            result.data!['getModerateContent'][index]
                                ['pictureUrl'],
                            result.data!['getModerateContent'][index]['title'],
                            result.data!['getModerateContent'][index]
                                ['description'],
                            result.data!['getModerateContent'][index]
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
                                  result.data!['getModerateContent'][index]
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
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/ContentDetail",
                          arguments: [
                            result.data!['getModeratelySeverContent'][index]
                                ['pictureUrl'],
                            result.data!['getModeratelySeverContent'][index]
                                ['title'],
                            result.data!['getModeratelySeverContent'][index]
                                ['description'],
                            result.data!['getModeratelySeverContent'][index]
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
                                      [index]['pictureUrl']),
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
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/ContentDetail",
                          arguments: [
                            result.data!['getSevereContent'][index]
                                ['pictureUrl'],
                            result.data!['getSevereContent'][index]['title'],
                            result.data!['getSevereContent'][index]
                                ['description'],
                            result.data!['getSevereContent'][index]['createAt']
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
                                  result.data!['getSevereContent'][index]
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
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/ContentDetail",
                          arguments: [
                            result.data!['getSmartContent'][index]
                                ['pictureUrl'],
                            result.data!['getSmartContent'][index]['title'],
                            result.data!['getSmartContent'][index]
                                ['description'],
                            result.data!['getSmartContent'][index]['createAt']
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
                                  result.data!['getSmartContent'][index]
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
