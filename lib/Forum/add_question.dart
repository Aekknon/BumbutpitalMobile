import 'package:bumbutpital/ComponentMainScreen/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({Key? key}) : super(key: key);

  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  static const addForum = """
      
    mutation(\$title: String! , \$description: String! ){
  createForum(title: \$title , description: \$description){
    title
    description
  }
}
                        """;

  final _title = TextEditingController();
  final _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Color(0xffECF2FF),
        elevation: 0,
      ),
      body: Container(
        color: Color(0xffECF2FF),
        height: MediaQuery.of(context).size.height,
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Color(0xffECF2FF),
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Container(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 20, right: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: _textField1(_title, "title"),
                              )
                            ],
                          ),
                        ],
                      )),
                ),
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
                                _textField(_description, "description"),
                                SizedBox(
                                  height: 30,
                                ),
                                Mutation(
                                  options:
                                      MutationOptions(document: gql(addForum)),
                                  builder: (run, _) => ElevatedButton(
                                      onPressed: () async {
                                        await onSubmit(run);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Color((0xff6367EA)),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 100, vertical: 15),
                                      ),
                                      child: Container(
                                        width: 150,
                                        child: Row(
                                          children: [
                                            Spacer(),
                                            Text(
                                              "SUBMIT QUESTION",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                      )),
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
    );
  }

  TextField _textField(TextEditingController cont, String label) {
    return TextField(
      controller: cont,
      maxLines: 15,
      // textAlign: TextAlign.start,
      style: GoogleFonts.karla(color: Color(0xff6367EA)),
      decoration: InputDecoration(
        // labelStyle: St,
        hintText: "Enter your Question",
        contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.visiblePassword,
      autocorrect: true,
    );
  }

  TextField _textField1(TextEditingController cont, String label) {
    return TextField(
      controller: cont,
      style: GoogleFonts.karla(color: Color(0xff6367EA)),
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 24),
        hintText: "Enter your ${label.toLowerCase()}",
        fillColor: Colors.white,
        // contentPadding: EdgeInsets.symmetric(
        //     vertical: 00, horizontal: 0),
        border: UnderlineInputBorder(),
      ),
      keyboardType: TextInputType.visiblePassword,
      autocorrect: true,
    );
  }

  Future ErrorDialog1() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Please fill all of Title and Question field Please"),
        actions: [
          TextButton(
              child: Text("OK", style: TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.pop(context, true);
              })
        ],
      ),
    );
  }

  Future<void> onSubmit(RunMutation run) async {
    if (_title.text.isEmpty || _description.text.isEmpty) {
      return await ErrorDialog1();
    }
    try {
      final response = run({
        "title": _title.text,
        "description": _description.text,
      });
      print((await response.networkResult) as dynamic);

      Navigator.of(context).pop();
    } catch (err) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error!'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Insert your Question'),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  String search = 'dead';

  @override
  void initState() {
    super.initState();
    caseSensitive:
    false;
    RegExp exp = RegExp(
      "\\b" + search + "\\b",
      caseSensitive: false,
    );
    bool containe = exp.hasMatch(_title.text);
    print(containe);
  }
}
