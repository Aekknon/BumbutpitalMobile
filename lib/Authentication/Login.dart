// import 'package:bumbutpital/Authentication/SignUp.dart';
// import 'package:bumbutpital/MainPage.dart';
// import 'package:bumbutpital/SplashScreen.dart';
// import 'package:bumbutpital/mainPage.dart';
// import 'package:bumbutpital/SplashScreen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  var isPasswordHidden = true;
  var isRemember = true;

  void onSubmit() {
    // access controller value buy using _email.text
    // bla bla
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LoginPage",
      home: Scaffold(
        backgroundColor: Color(0XFFECF2FF),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 84),
                  Container(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: 24),
                  _textField(
                    _email,
                    "Email",
                    Icon(Icons.email),
                  ),
                  SizedBox(height: 10),
                  _textField(
                    _password,
                    "Password",
                    Icon(Icons.password),
                  ),
                  Container(
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(height: 2),
                    ),
                    alignment: Alignment.bottomRight,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Checkbox(
                          value: isRemember,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                isRemember = value;
                              });
                            }
                          },
                        ),
                        Text('Remember Me'),
                      ],
                    ),
                  ),
                  Container(),
                  ElevatedButton(
                    onPressed: onSubmit,
                    child: Text("Login"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextField _textField(TextEditingController cont, String label, Icon icon) {
    return TextField(
      controller: cont,
      obscureText: label == "Password" ? isPasswordHidden : false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        hintText: "Enter your ${label.toLowerCase()}",
        prefixIcon: icon,
        suffixIcon: label == "Password"
            ? InkWell(
                onTap: () {
                  setState(() {
                    isPasswordHidden = !isPasswordHidden;
                  });
                },
                child: isPasswordHidden
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : null,
        contentPadding: EdgeInsets.symmetric(vertical: 0),
      ),
      keyboardType: TextInputType.visiblePassword,
      autocorrect: true,
    );
  }
}
