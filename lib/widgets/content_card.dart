import 'package:bumbutpital/ContentPage/content_detail.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({Key? key}) : super(key: key);
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
                      arguments:[result.data!['getSmartContent'][index]['pictureUrl'],
                                 result.data!['getSmartContent'][index]['title'],
                                 result.data!['getSmartContent'][index]['description']] ,
                      
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
                                            result.data!['getSmartContent'][index]['pictureUrl']),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                ),
                SizedBox(
              height: 10,)
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

class ContentCard1 extends StatelessWidget {
  const ContentCard1({Key? key}) : super(key: key);
  static const query = """
                   query {
    getSmartContentHealth {
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
        final content = result.data!['getSmartContentHealth'];
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
                      arguments:[result.data!['getSmartContentHealth'][index]['pictureUrl'],
                                 result.data!['getSmartContentHealth'][index]['title'],
                                 result.data!['getSmartContentHealth'][index]['description']] ,
                      
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
                                            result.data!['getSmartContentHealth'][index]['pictureUrl']),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                ),
                SizedBox(
              height: 10,)
                  ],
                );
              },
              itemCount: result.data!['getSmartContentHealth'].length,
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
    getSmartContentDepression {
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
        final content = result.data!['getSmartContentDepression'];
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
                      arguments:[result.data!['getSmartContentDepression'][index]['pictureUrl'],
                                 result.data!['getSmartContentDepression'][index]['title'],
                                 result.data!['getSmartContentDepression'][index]['description']] ,
                      
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
                                            result.data!['getSmartContentDepression'][index]['pictureUrl']),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                ),
                SizedBox(
              height: 10,)
                  ],
                );
              },
              itemCount: result.data!['getSmartContentDepression'].length,
            )),
            
            
          ],
        );
      },
    );
  }
}
