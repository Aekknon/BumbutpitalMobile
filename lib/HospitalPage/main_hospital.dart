import 'package:bumbutpital/HospitalPage/hospital_detail.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// ignore: use_key_in_widget_constructors
class MainHospital extends StatefulWidget {
  @override
  __MainHospitalState createState() => __MainHospitalState();
}

const query = """
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

class __MainHospitalState extends State<MainHospital> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: Color(0XFF6367EA),
          elevation: 0,
        ),
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
            final hospital = result.data!['getAllHospital'];
            return Column(
              children: [
                Expanded(
                    child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Color(0XFFECF2FF),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          color: Color(0XFF6367EA),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                        ),
                        child: Center(
                            child: Column(
                          children: [
                            Expanded(
                              child: Align(
                                  alignment: FractionalOffset.bottomCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      'Hospital',
                                      style: TextStyle(
                                          fontSize: 32,
                                          color: Colors.white,
                                          decoration: TextDecoration.none),
                                    ),
                                  ) //Your widget here,
                                  ),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        )),
                      ),
                      Expanded(
                          child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: 
                                  InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HospitalDetail()));
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
                                            hospital[index]['imageUrl']),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                SizedBox(height: 15,)
                                ],)
                              ),
                              
                                
                              );
                            },
                            itemCount: result.data!['getAllHospital'].length,
                          ),)
                    ],
                  ),
                ))
              ],
            );
          },
        ));
  }
}
