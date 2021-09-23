// ignore: file_names


import 'package:bumbutpital/HospitalPage/hospital_detail.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// ignore: camel_case_types
class promotioninhospitaldetail_card extends StatelessWidget {
  const promotioninhospitaldetail_card({Key? key}) : super(key: key);
  static const query = """
                       query {
    getAllpromotioninhospitaldetail_card{
      promotionId
      hospitalId
      userId
      createAt
      title
      hospitalDetail
      couponCode
      Url

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
                              return 
                                  InkWell(
                                 onTap: () {
                    Navigator.pushNamed(
                      context,
                      "/PromotionInHospitalDetail",
                      arguments:[result.data!['getAllpromotioninhospitaldetail_card'][index]['title'],
                                 result.data!['getAllpromotioninhospitaldetail_card'][index]['hospitalDetail'],
                                 result.data!['getAllpromotioninhospitaldetail_card'][index]['Url'],
                                 result.data!['getAllpromotioninhospitaldetail_card'][index]['createAt']] ,
                      
                    );
                  },
                                child: Column(children: [
                                  Container(
                                  height: MediaQuery.of(context).size.height*0.2,
                                  width: MediaQuery.of(context).size.width*0.9,
                                  padding: EdgeInsets.all(15),
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
                                            result.data!['getAllpromotioninhospitaldetail_card'][index]['Url']),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                SizedBox(height: 15,)
                                ],)
                              
                              
                                
                              );
                            },
                            itemCount: result.data!['getAllpromotioninhospitaldetail_card'].length,
                          ),)
          ],
        );
      },
    );
  }
}



