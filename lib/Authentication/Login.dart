import 'package:bumbutpital/Authentication/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:bumbutpital/ComponentMainScreen/bottomnavbar.dart';

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
    // access controller value by using _email.text
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
                  SizedBox(height: 50),
                  Container(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: 44),
                  _textField(
                    _email,
                    "Email",
                    Icon(Icons.email),
                  ),
                  SizedBox(height: 44),
                  _textField(
                    _password,
                    "Password",
                    Icon(Icons.lock),
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
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BottomNavBar()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0XFFFE7940),
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15),

                      // padding: EdgeInsets.symmetric(
                      //     horizontal: 165, vertical: 15)
                    ),
                    child: Text("Login"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: Text("-OR-"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: Text('Sign in with'),
                  ),
                  SizedBox(height: 24),
                  Container(
                      child: ElevatedButton.icon(
                    icon: Icon(
                      Icons.mail_outline,
                      color: Color(0XFF6367EA),
                      size: 24.0,
                    ),
                    label: Text(
                      'Sign in with Google account',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      print('Pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      //fixedSize: Size(350, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  )),
                  SizedBox(height: 16),
                  Container(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      'Sign Up',
                    ),
                  )),
                  SizedBox(height: 16),
                  Container(
                    child: Text("Don't have an Account?"),
                  ),
                  // ElevatedButton(
                  //   onPressed: onSubmit,
                  //   style: ElevatedButton.styleFrom(
                  //       primary: Color(0XFFFFFFFF),
                  //       fixedSize: Size(350, 50)),
                  //   child: Text(
                  //     "Sign in with Google account",
                  //     style: TextStyle(color: Colors.black.withOpacity(0.8)),
                  //   ),
                  // ),
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
