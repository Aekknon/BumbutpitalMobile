import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bumbutpital/Diary/sql_helper.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MainDiary extends StatefulWidget {
  MainDiary({Key? key }) : super(key: key);
  

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
  final TextEditingController _sensitivePoint = TextEditingController();
  final TextEditingController _countBadDiary = TextEditingController();

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
      _sensitivePoint.text = existingJournal['sensitivePoint'];
      _countBadDiary.text = existingJournal['countBadDiary'];
    }

    final now = new DateTime.now();
    String Day = DateFormat.yMMMMd('en_US').format(now);
    String Time = new DateFormat.jm().format(now);
    double _initialRating = 3.0;
    bool _isVertical = false;
    late final _ratingController;
    late double _rating;
    void initState() {
      super.initState();
      _ratingController = TextEditingController(text: '3.0');
      _rating = _initialRating;
    }

    int countBadDiary = 0;

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
                  height: MediaQuery.of(context).size.height * 0.5,
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

                                    return Container(
                                      child: Column(
                                        children: [
                                          TextField(
                                            inputFormatters: [
                                              //only numeric keyboard.
                                              LengthLimitingTextInputFormatter(
                                                  33), //only 6 digit
                                            ],
                                            controller: _userID,
                                            enabled: false,
                                            maxLines: 1,
                                            style:
                                                TextStyle(color: Colors.white),
                                            decoration: InputDecoration(
                                              hintStyle: TextStyle(fontSize: 1),
                                              fillColor: Colors.white,
                                              border: InputBorder.none,
                                            ),
                                          ),
                                          TextField(
                                            inputFormatters: [
                                              //only numeric keyboard.
                                              LengthLimitingTextInputFormatter(
                                                  33), //only 6 digit
                                            ],
                                            controller: _sensitivePoint,
                                            enabled: false,
                                            maxLines: 1,
                                            style:
                                                TextStyle(color: Colors.white),
                                            decoration: InputDecoration(
                                              hintStyle: TextStyle(fontSize: 1),
                                              fillColor: Colors.white,
                                              border: InputBorder.none,
                                            ),
                                          ),
                                          TextField(
                                            inputFormatters: [
                                              //only numeric keyboard.
                                              LengthLimitingTextInputFormatter(
                                                  33), //only 6 digit
                                            ],
                                            controller: _countBadDiary,
                                            enabled: false,
                                            maxLines: 1,
                                            style:
                                                TextStyle(color: Colors.white),
                                            decoration: InputDecoration(
                                              hintStyle: TextStyle(fontSize: 1),
                                              fillColor: Colors.white,
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Spacer(),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: RatingBar.builder(
                        initialRating: _initialRating,
                        direction:
                            _isVertical ? Axis.vertical : Axis.horizontal,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, index) {
                          switch (index) {
                            case 0:
                              return Container(
                                transform:
                                    Matrix4.translationValues(0, -25, 0.0),
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'asset/image/crying.png'))),
                                ),
                              );
                            case 1:
                              return Container(
                                transform:
                                    Matrix4.translationValues(0, -25, 0.0),
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'asset/image/disappointed.png'))),
                                ),
                              );
                            case 2:
                              return Container(
                                transform:
                                    Matrix4.translationValues(0, -25, 0.0),
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'asset/image/annoyed.png'))),
                                ),
                              );
                            case 3:
                              return Container(
                                transform:
                                    Matrix4.translationValues(0, -25, 0.0),
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'asset/image/wink.png'))),
                                ),
                              );
                            case 4:
                              return Container(
                                transform:
                                    Matrix4.translationValues(0, -25, 0.0),
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'asset/image/smile.png'))),
                                ),
                              );
                            default:
                              return Container();
                          }
                        },
                        onRatingUpdate: (rating) {
                          setState(() {
                            _rating = rating;
                          });
                        },
                        updateOnDrag: true,
                      ),
                    ),
                    Spacer()
                  ],
                ),
                Query(
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

                    return Container(
                      child: Row(
                        children: [
                          Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color((0xff6367EA)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 100, vertical: 15),
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            child: Text(
                              'Add Diary',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  decoration: TextDecoration.none),
                            ),
                            onPressed: () async {
                              // Save new journal
                              _userID.text =
                                  result.data!['getCurrentUser'][0]['id'];

                              _sensitivePoint.text = _rating.toString();
                              print(_sensitivePoint.text);

                              
                             
                              _countBadDiary.text = 'empty/not use';

                              if (id == null) {
                                await _addItem();
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
                          ),
                          Spacer()
                        ],
                      ),
                    );
                  },
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

    await SQLHelper.createItem(
        _titleController.text,
        _descriptionController.text,
        Day + " " + Time,
        _userID.text,
        _sensitivePoint.text,
        _countBadDiary.text);
    _refreshJournals();
  }

  // Update an existing journal
  Future<void> _updateItem(int id) async {
    final now = new DateTime.now();
    String Day = DateFormat.yMMMMd('en_US').format(now);
    String Time = new DateFormat.jm().format(now);

    await SQLHelper.updateItem(
        id,
        _titleController.text,
        _descriptionController.text,
        Day + ' ' + Time,
        _userID.text,
        _sensitivePoint.text,
        _countBadDiary.text);
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
                        String emotion = '';

                        // 2.0
                        if (_journals[reverseIndex]['sensitivePoint'] ==
                            '5.0') {
                          emotion = 'asset/image/smile.png';
                        } else if (_journals[reverseIndex]['sensitivePoint'] ==
                            '4.0') {
                          emotion = 'asset/image/wink.png';
                        } else if (_journals[reverseIndex]['sensitivePoint'] ==
                            '3.0') {
                          emotion = 'asset/image/annoyed.png';
                        } else if (_journals[reverseIndex]['sensitivePoint'] ==
                            '2.0') {
                          emotion = 'asset/image/disappointed.png';
                        } else if (_journals[reverseIndex]['sensitivePoint'] ==
                            '1.0') {
                          emotion = 'asset/image/crying.png';
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
                                                Column(
                                                  children: [
                                                    Container(
                                                      transform: Matrix4
                                                          .translationValues(
                                                              0, -25, 0.0),
                                                      child: Container(
                                                        height: 50,
                                                        width: 50,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    emotion))),
                                                      ),
                                                    ),
                                                    //     Row(
                                                    //       children: [
                                                    //         Container(

                                                    //   child: IconButton(
                                                    //   icon: const Icon(
                                                    //     Icons.edit,
                                                    //     color: Colors.white,
                                                    //   ),
                                                    //   onPressed: () => _showForm(
                                                    //       _journals[reverseIndex]
                                                    //           ['id']),
                                                    // ),),
                                                    // IconButton(
                                                    //   icon: const Icon(
                                                    //     Icons.delete,
                                                    //     color: Colors.red,
                                                    //   ),
                                                    //   onPressed: () => _deleteItem(
                                                    //       _journals[reverseIndex]
                                                    //           ['id']),
                                                    // ),
                                                    //       ],
                                                    //     )
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                )
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
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Visibility(
                                              child: Text(
                                                  'By: ' +
                                                      result.data![
                                                              'getCurrentUser']
                                                          [0]['name'] +
                                                      " " +
                                                      result.data![
                                                              'getCurrentUser']
                                                          [0]['surname'] +
                                                      "  UserID: " +
                                                      result.data![
                                                              'getCurrentUser']
                                                          [0]['id'],
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
