import 'package:bumbutpital/HospitalPage/hospital_detail.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class PromotionCard extends StatelessWidget {
  const PromotionCard({Key? key}) : super(key: key);
  static const query = """
                    query {
    getAllPromotion{
      promotionId
      hospitalId
      createAt
      title
      hospitalDetail
      couponCode
      Url

    }
  }                """;

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
                          "/PromotionInHospitalDetail",
                          arguments: [
                            result.data!['getAllPromotion'][index]['title'],
                            result.data!['getAllPromotion'][index]
                                ['hospitalDetail'],
                            result.data!['getAllPromotion'][index]['Url'],
                            result.data!['getAllPromotion'][index]['createAt']
                          ],
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width * 0.9,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                  image: NetworkImage(result
                                      .data!['getAllPromotion'][index]['Url']),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      ));
                },
                itemCount: result.data!['getAllPromotion'].length,
              ),
            )
          ],
        );
      },
    );
  }
}
