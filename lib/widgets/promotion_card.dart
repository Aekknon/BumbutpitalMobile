
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class PromotionCard extends StatelessWidget {
  const PromotionCard({Key? key}) : super(key: key);
  static bool visible = true;
  static const query = """
                    query {
    getAllPromotion{
      promotionId
      hospitalId
      title
      hospitalDetail
      couponCode
      Url
      expiredDate

    }
  }                """;

  static const query1 = """
                    query {
    getPromotionLog{
      userId
      usedpromotionId
      keeppromotionId
      status
      

    }
  }                """;
  static const query2 = """
                   query {
    getCurrentUser {
     id
       name
    surname
    email
    phoneNumber
    appropiatePHQSeverity
    appropiatePHQSeverityScore
    }
  }
                  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Query(
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
        return Query(
          options: QueryOptions(
              document: gql(query1), pollInterval: Duration(seconds: 1)),
          builder: (QueryResult result1, {fetchMore, refetch}) {
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
            return Query(
              options: QueryOptions(
                  document: gql(query2), pollInterval: Duration(seconds: 1)),
              builder: (QueryResult result2, {fetchMore, refetch}) {
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
                        child: Scrollbar(
                          isAlwaysShown: true,
                          showTrackOnHover: true,
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          int reverseIndex =
                              result.data!['getAllPromotion'].length -
                                  1 -
                                  index;
                          bool visible = true;
                          int x = 0;
                          if (result1.data!['getPromotionLog'].length != null) {
                            for (var i = 0;
                                i < result1.data!['getPromotionLog'].length;
                                i++) {
                              if (result.data!['getAllPromotion'][reverseIndex]
                                          ['promotionId'] ==
                                      result1.data!['getPromotionLog'][i]
                                          ['usedpromotionId'] &&
                                  result1.data!['getPromotionLog'][i]
                                          ['status'] ==
                                      "use" &&
                                  result1.data!['getPromotionLog'][i]
                                          ['userId'] ==
                                      result2.data!['getCurrentUser'][0]
                                          ['id']) {
                                x = x + 1;
                              } else {
                                x = x;
                              }
                            }
                            if (x > 0) {
                              visible = false;
                            } else {
                              visible = true;
                            }
                          } else {
                            visible = true;
                          }

                          return Visibility(
                              visible: visible,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      "/PromotionInHospitalDetail",
                                      arguments: [
                                        result.data!['getAllPromotion']
                                            [reverseIndex]['title'],
                                        result.data!['getAllPromotion']
                                            [reverseIndex]['hospitalDetail'],
                                        result.data!['getAllPromotion']
                                            [reverseIndex]['Url'],
                                        result.data!['getAllPromotion']
                                            [reverseIndex]['promotionId'],
                                        result.data!['getAllPromotion']
                                            [reverseIndex]['expiredDate']
                                      ],
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.25,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            image: DecorationImage(
                                              image: NetworkImage(result
                                                      .data!['getAllPromotion']
                                                  [reverseIndex]['Url']),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      )
                                    ],
                                  )));
                        },
                        itemCount: result.data!['getAllPromotion'].length,
                      ),
                    ))
                  ],
                );
              },
            );
          },
        );
      },
    ),
    );
  }
}

class CurrentPromotionCard extends StatelessWidget {
  const CurrentPromotionCard({Key? key}) : super(key: key);
  static const query = """
                    query {
    getAllPromotion{
      promotionId
      hospitalId
      title
      hospitalDetail
      couponCode
      Url
      expiredDate

    }
  }                """;
  static const query1 = """
                    query {
    getPromotionLog{
      userId
      usedpromotionId
      keeppromotionId
      status
      

    }
  }                """;
  static const query2 = """
                   query {
    getCurrentUser {
     id
       name
    surname
    email
    phoneNumber
    appropiatePHQSeverity
    appropiatePHQSeverityScore
    }
  }
                  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Query(
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

          return Query(
            options: QueryOptions(
                document: gql(query1), pollInterval: Duration(seconds: 1)),
            builder: (QueryResult result1, {fetchMore, refetch}) {
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

              return Query(
                options: QueryOptions(
                    document: gql(query2), pollInterval: Duration(seconds: 1)),
                builder: (QueryResult result2, {fetchMore, refetch}) {
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
                          child: Scrollbar(
                        isAlwaysShown: true,
                        showTrackOnHover: true,
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            int reverseIndex =
                                result.data!['getAllPromotion'].length -
                                    1 -
                                    index;
                            bool visible = true;
                            int x = 1;
                            for (var i = 0;
                                i < result1.data!['getPromotionLog'].length;
                                i++) {
                              if (result.data!['getAllPromotion'][reverseIndex]
                                          ['promotionId'] ==
                                      result1.data!['getPromotionLog'][i]
                                          ['keeppromotionId'] &&
                                  result2.data!['getCurrentUser'][0]['id'] ==
                                      result1.data!['getPromotionLog'][i]
                                          ['userId']) {
                                x = x - 1;
                                for (var j = 0;
                                    j < result1.data!['getPromotionLog'].length;
                                    j++) {
                                  if (result.data!['getAllPromotion']
                                              [reverseIndex]['promotionId'] ==
                                          result1.data!['getPromotionLog'][j]
                                              ['usedpromotionId'] &&
                                      result2.data!['getCurrentUser'][0]
                                              ['id'] ==
                                          result1.data!['getPromotionLog'][j]
                                              ['userId']) {
                                    x = x + 1;
                                  }
                                }
                              }
                            }

                            if (x == 0) {
                              visible = true;
                            } else {
                              visible = false;
                            }
                            return Visibility(
                                visible: visible,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        "/CurrentPromotionInHospitalDetail",
                                        arguments: [
                                          result.data!['getAllPromotion']
                                              [reverseIndex]['title'],
                                          result.data!['getAllPromotion']
                                              [reverseIndex]['hospitalDetail'],
                                          result.data!['getAllPromotion']
                                              [reverseIndex]['Url'],
                                          result.data!['getAllPromotion']
                                              [reverseIndex]['promotionId'],
                                          result.data!['getAllPromotion']
                                              [reverseIndex]['expiredDate']
                                        ],
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    result.data![
                                                            'getAllPromotion']
                                                        [reverseIndex]['Url']),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        )
                                      ],
                                    )));
                          },
                          itemCount: result.data!['getAllPromotion'].length,
                        ),
                      ))
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
