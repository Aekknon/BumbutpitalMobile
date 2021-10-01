// ignore_for_file: avoid_unnecessary_containers, file_names

import 'package:bumbutpital/Authentication/sign_up.dart';
import 'package:bumbutpital/services/graphql_config.dart';
import 'package:flutter/material.dart';
import 'package:bumbutpital/ComponentMainScreen/bottom_navbar.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const loginQuery = """
     mutation UserLogin(\$username: String!,\$password: String!){
      userLogin(username: \$username,password: \$password){
        accessToken
      }
    }
                        """;
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _graphqlConfig = GraphQLConfiguration();

  var isPasswordHidden = true;
  var isRemember = true;

  Future<void> onSubmit(RunMutation run) async {
    if (_email.text.isEmpty || _password.text.isEmpty) return;

    try {
      final response = run({
        "username": _email.text,
        "password": _password.text,
      });
      final token = ((await response.networkResult) as dynamic)
          .data["userLogin"]["accessToken"];

      await Provider.of<GraphQLConfiguration>(context, listen: false)
          .setToken(token);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => BottomNavBar()),
          (route) => false);
    } catch (err) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error!'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Email or Password is incorrect'),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Mutation(
                  options: MutationOptions(document: gql(loginQuery)),
                  builder: (run, _) => ElevatedButton(
                    onPressed: () async {
                      await onSubmit(run);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0XFFFE7940),
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    ),
                    child: Text("Login"),
                  ),
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
                Text('Sign in with'),
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
                    // ignore: avoid_print
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
                Text("Don't have an Account?"),
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
