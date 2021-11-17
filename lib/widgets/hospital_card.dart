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
                child: Scrollbar(
              isAlwaysShown: true,
              showTrackOnHover: true,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  int reverseIndex =
                      result.data!['getAllHospital'].length - 1 - index;
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/HospitalDetail",
                        arguments: [
                          result.data!['getAllHospital'][reverseIndex]
                              ['hospitalName'],
                          result.data!['getAllHospital'][reverseIndex]
                              ['hospitalDescription'],
                          result.data!['getAllHospital'][reverseIndex]
                              ['imageUrl'],
                          result.data!['getAllHospital'][reverseIndex]
                              ['hospitalID'],
                        ],
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
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
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              image: DecorationImage(
                                image: NetworkImage(
                                    result.data!['getAllHospital'][reverseIndex]
                                        ['imageUrl']),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.9,
                            padding: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Row(
                              children: [
                                Text(result.data!['getAllHospital'][reverseIndex]
                                        ['hospitalName'], style: TextStyle(fontWeight: FontWeight.bold),),
                                
                              ],
                            )),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  );
                },
                itemCount: result.data!['getAllHospital'].length,
              ),
            ))
          ],
        );
      },
    );
  }
}
