import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bumbutpital/Diary/sql_helper.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MainDiary extends StatefulWidget {
  MainDiary({Key? key}) : super(key: key);

  @override
  _MainDiaryState createState() => _MainDiaryState();
}

class _MainDiaryState extends State<MainDiary> {
  static const query = """
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
  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;
  // This function is used to fetch all data from the database
  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals(); // Loading the diary when the app starts
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _userID = TextEditingController();

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
          _journals.firstWhere((element) => element['id'] == id);
      _titleController.text = existingJournal['title'];
      _descriptionController.text = existingJournal['description'];
      _userID.text = existingJournal['userID'];
    }

    final now = new DateTime.now();
    String Day = DateFormat.yMMMMd('en_US').format(now);
    String Time = new DateFormat.jm().format(now);

    showModalBottomSheet(
      context: context,
      elevation: 5,
      builder: (_) => Container(
        color: Color(0xffECF2FF),
        height: MediaQuery.of(context).size.height,
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                    color: Color(0xffECF2FF),
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Column(
                      children: [
                        Text(
                          Day,
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Text(
                              Time,
                              // textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: TextField(
                                inputFormatters: [
                                  //only numeric keyboard.
                                  LengthLimitingTextInputFormatter(
                                      33), //only 6 digit
                                ],
                                controller: _titleController,
                                maxLines: 1,
                                style: TextStyle(color: Color(0xff6367EA)),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 24),
                                  hintText: 'Enter Title Diary',
                                  fillColor: Colors.white,
                                  // contentPadding: EdgeInsets.symmetric(
                                  //     vertical: 00, horizontal: 0),
                                  border: UnderlineInputBorder(),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(70),
                        topLeft: Radius.circular(70)),
                  ),
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 30, right: 30),
                        child: Container(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 20, right: 20),
                            child: Column(
                              children: [
                                TextField(
                                  controller: _descriptionController,
                                  maxLines: 15,
                                  // textAlign: TextAlign.start,
                                  style: TextStyle(color: Color(0xff6367EA)),
                                  decoration: InputDecoration(
                                    // labelStyle: St,
                                    hintText: 'Enter your story here',
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 24, horizontal: 8),
                                    border: InputBorder.none,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Query(
                                  options: QueryOptions(
                                      document: gql(query),
                                      pollInterval: Duration(seconds: 1)),
                                  builder: (QueryResult result,
                                      {fetchMore, refetch}) {
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

                                    return TextField(
                                      inputFormatters: [
                                        //only numeric keyboard.
                                        LengthLimitingTextInputFormatter(
                                            33), //only 6 digit
                                      ],
                                      controller: _userID,
                                      enabled: false,
                                      maxLines: 1,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(fontSize: 24),
                                        fillColor: Colors.white,
                                        border: InputBorder.none,
                                      ),
                                    );
                                  },
                                ),
                                Query(
                                  options: QueryOptions(
                                      document: gql(query),
                                      pollInterval: Duration(seconds: 1)),
                                  builder: (QueryResult result,
                                      {fetchMore, refetch}) {
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

                                    return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Color((0xff6367EA)),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 100, vertical: 15),
                                          textStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      child: Text(
                                        'Add Diary',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            decoration: TextDecoration.none),
                                      ),
                                      onPressed: () async {
                                        // Save new journal
                                        _userID.text = result
                                            .data!['getCurrentUser'][0]['id'];
                                        if (id == null) {
                                          await _addItem();
                                          print(_journals.length.toString());
                                        }
                                        if (id != null) {
                                          await _updateItem(id);
                                        }

                                        // Clear the text fields
                                        _titleController.text = '';
                                        _descriptionController.text = '';

                                        // Close the bottom sheet
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  },
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

// Insert a new journal to the database
  Future<void> _addItem() async {
    final now = new DateTime.now();
    String Day = DateFormat.yMMMMd('en_US').format(now);
    String Time = new DateFormat.jm().format(now);

    await SQLHelper.createItem(_titleController.text,
        _descriptionController.text, Day + " " + Time, _userID.text);
    _refreshJournals();
  }

  // Update an existing journal
  Future<void> _updateItem(int id) async {
    final now = new DateTime.now();
    String Day = DateFormat.yMMMMd('en_US').format(now);
    String Time = new DateFormat.jm().format(now);

    await SQLHelper.updateItem(id, _titleController.text,
        _descriptionController.text, Day + ' ' + Time, _userID.text);
    _refreshJournals();
  }

  // Delete an item
  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a journal!'),
    ));
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffECF2FF),
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Query(
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

                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _journals.length,
                      itemBuilder: (BuildContext context, int index) {
                        int reverseIndex = _journals.length - 1 - index;

                        bool visible = false;
                        if (_journals[reverseIndex]['userID'] ==
                            result.data!['getCurrentUser'][0]['id']) {
                          visible = true;
                        }
                        return Visibility(
                          visible: visible,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 50,
                              ),
                              Column(
                                children: [
                                  Spacer(),
                                  Container(
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
                                        color: Color(0xff6367EA),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            topLeft: Radius.circular(10)),
                                      ),
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.7,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                    _journals[reverseIndex]
                                                        ['createdAt'],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Spacer(),
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.edit,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: () => _showForm(
                                                      _journals[reverseIndex]
                                                          ['id']),
                                                ),
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                  onPressed: () => _deleteItem(
                                                      _journals[reverseIndex]
                                                          ['id']),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Spacer(),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.7,
                                                  child: Text(
                                                      _journals[reverseIndex]
                                                          ['title'],
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                Spacer(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                                padding: EdgeInsets.all(10),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.72,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.52,
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
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight: Radius
                                                              .circular(10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10)),
                                                ),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.5,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.4,
                                                  child: SingleChildScrollView(
                                                    child: Text(
                                                        _journals[reverseIndex]
                                                            ['description'],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14)),
                                                  ),
                                                )),
                                                SizedBox(height: 10,),
                                            Visibility(
                                              child: Text(
                                                 'By: '+result.data!['getCurrentUser'][0]['name'] + " " + result.data!['getCurrentUser'][0]['surname'],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14)),
                                            )
                                          ],
                                        ),
                                      )),
                                  Spacer(),
                                ],
                              )
                            ],
                          ),
                        );
                      });
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff6367EA),
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}
