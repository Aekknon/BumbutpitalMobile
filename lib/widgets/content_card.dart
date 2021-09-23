import 'package:bumbutpital/ContentPage/content_detail.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({Key? key}) : super(key: key);
  static const query = """
                   query {
    getAllContent {
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
        final content = result.data!['getAllContent'];
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
                      arguments:[result.data!['getAllContent'][index]['pictureUrl'],
                                 result.data!['getAllContent'][index]['title'],
                                 result.data!['getAllContent'][index]['description']] ,
                      
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
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            result.data!['getAllContent'][index]['pictureUrl']),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                ),
                SizedBox(
              height: 10,)
                  ],
                );
              },
              itemCount: result.data!['getAllContent'].length,
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
    getAllContent {
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
        final content = result.data!['getAllContent'];
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
                      arguments:[result.data!['getAllContent'][index]['pictureUrl'],
                                 result.data!['getAllContent'][index]['title'],
                                 result.data!['getAllContent'][index]['description']] ,
                      
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
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            result.data!['getAllContent'][index]['pictureUrl']),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                ),
                SizedBox(
              height: 10,)
                  ],
                );
              },
              itemCount: result.data!['getAllContent'].length,
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
    getAllContent {
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
        final content = result.data!['getAllContent'];
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
                      arguments:[result.data!['getAllContent'][index]['pictureUrl'],
                                 result.data!['getAllContent'][index]['title'],
                                 result.data!['getAllContent'][index]['description']] ,
                      
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
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            result.data!['getAllContent'][index]['pictureUrl']),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                ),
                SizedBox(
              height: 10,)
                  ],
                );
              },
              itemCount: result.data!['getAllContent'].length,
            )),
            
            
          ],
        );
      },
    );
  }
}
