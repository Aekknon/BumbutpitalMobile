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
                return InkWell(
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
                      child: Image.network(content[index]['pictureUrl'],
                          fit: BoxFit.fill)),
                );
              },
              itemCount: result.data!['getAllContent'].length,
            ))
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

        return Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
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
                      child: Image.network(
                          result.data!['getAllContent'][index]['pictureUrl'].toString(),
                          fit: BoxFit.fill)),
                );
              },
              itemCount: result.data!['getAllContent'].length,
            ))
          ],
        );
      },
    );
  }
}

class ContentCard2 extends StatelessWidget {
  const ContentCard2({Key? key}) : super(key: key);
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
                          child: Image.network(
                            result.data!['getAllContent'][index]['pictureUrl'].toString(),
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                );
              },
              itemCount: result.data!['getAllContent'].length,
            ))
          ],
        );
      },
    );
  }
}
