import 'package:bumbutpital/Forum/add_question.dart';
import 'package:flutter/material.dart';
import 'all_question.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MainForumPage extends StatefulWidget {
  const MainForumPage({Key? key}) : super(key: key);

  @override
  _MainForumPageState createState() => _MainForumPageState();
}

class _MainForumPageState extends State<MainForumPage> {
   static const query = """
      
   query{
  getAllForum{
     title
    description
    answer
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
        final forum = result.data!['getAllForum'];
        return  Container(
            color: Color(0xffECF2FF),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Color(0xff6367EA),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(70),
                            bottomRight: Radius.circular(70)),
                      ),
                      child: Center(
                        child: Text(
                          'FORUM Q&A',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                    Spacer()
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child:ListView.builder(
                     itemCount: result.data!['getAllForum'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AllQuestion()));
                      },
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  color: Color(0xff6367EA),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12)),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  color: Color(0xff6367EA),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12)),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  color: Color(0xff6367EA),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12)),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  color: Color(0xff6367EA),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12)),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 300,
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
                                      bottomLeft: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12)),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                        width: 300,
                                        decoration: BoxDecoration(
                                          color: Color(0xff6367EA),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                             result.data!['getAllForum'][index]['title'],
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  decoration: TextDecoration.none),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        )),
                                    Container(
                                      width: 300,
                                      color: Colors.white,
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 10, left: 30, right: 10),
                                      child: Text(
                                         result.data!['getAllForum'][index]['description'],
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            decoration: TextDecoration.none),
                                      ),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 5,
                                            left: 10,
                                            right: 10),
                                        child: Column(
                                          children: [
                                            Text(
                                              result.data!['getAllForum'][index]['answer'],
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  decoration: TextDecoration.none),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Dr. WIsa Moolhom',
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.black,
                                                  decoration: TextDecoration.none),
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                        ],
                      );
                    }
                    
                    ),
                  ),
              ],
        ),
      
      );
      }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddQuestion()));
          },
          child: const Icon(Icons.add),
          backgroundColor: Color(0xff6367EA)),
      
    );
  }
}

 