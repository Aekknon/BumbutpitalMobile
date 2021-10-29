

import 'package:bumbutpital/HospitalPage/hospital_detail.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HospitalCard extends StatelessWidget {
  const HospitalCard({Key? key}) : super(key: key);
  static const query = """
                    query {
    getAllHospital{
      hospitalID
      staffID
      hospitalName
      hospitalDescription
      imageUrl
      
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
                      "/HospitalDetail",
                      arguments:[result.data!['getAllHospital'][index]['hospitalName'],
                                 result.data!['getAllHospital'][index]['hospitalDescription'],
                                 result.data!['getAllHospital'][index]['imageUrl'],
                                 result.data!['getAllHospital'][index]['hospitalID'],] ,
                      
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
                                            result.data!['getAllHospital'][index]['imageUrl']),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                SizedBox(height: 15,)
                                ],)
                              
                              
                                
                              );
                            },
                            itemCount: result.data!['getAllHospital'].length,
                          ),)
          ],
        );
      },
    );
  }
}

