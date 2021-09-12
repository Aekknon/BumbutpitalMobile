import 'package:bumbutpital/Questionare/MainQuestion.dart';
import 'package:bumbutpital/mainPage.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUp> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _FullName = TextEditingController();
  final _SurName = TextEditingController();
  var isPasswordHidden = true;
  var isRemember = true;

  void onSubmit() {
    // access controller value by using _email.text
    // bla bla
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Sign Up Page",
        home: Scaffold(
            backgroundColor: Color(0XFFECF2FF),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 72),
                        Container(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                        SizedBox(height: 39),
                        _textField(
                          _FullName,
                          "Full Name",
                        ),
                        SizedBox(height: 39),
                        _textField(
                          _SurName,
                          "Surname",
                        ),
                        SizedBox(height: 39),
                        _textField(
                          _email,
                          "Email",
                        ),
                        SizedBox(height: 39),
                        _textField(
                          _password,
                          "Password",
                        ),
                        SizedBox(height: 39),
                        _textField(
                          _password,
                          "Confirm Password",
                        ),
                        SizedBox(height: 29),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainQuestion()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0XFFFE7940),
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 15),
                          ),
                          child: Text("REGISTER"),
                        ),
                      ]),
                ),
              ),
            )));
  }

  TextField _textField(TextEditingController cont, String label) {
    return TextField(
      controller: cont,
      obscureText: label == "Password" ? isPasswordHidden : false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        hintText: "Enter your ${label.toLowerCase()}",
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      ),
      keyboardType: TextInputType.visiblePassword,
      autocorrect: true,
    );
  }
}
