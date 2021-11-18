// ignore_for_file: avoid_unnecessary_containers, file_names

import 'package:bumbutpital/Authentication/sign_up.dart';
import 'package:bumbutpital/Questionare/main_question.dart';
import 'package:bumbutpital/services/graphql_config.dart';
import 'package:flutter/material.dart';
import 'package:bumbutpital/ComponentMainScreen/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';
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
          MaterialPageRoute(builder: (context) => MainQuestion()),
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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient:
              LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0XFFECF2FF), Colors.white])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset('asset/image/Bumbutpital Logo.png'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text('BUMBUTPITAL',
                          style: GoogleFonts.karla(fontWeight: FontWeight.normal , fontSize: 12)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Text(
                      'Login',
                      style: GoogleFonts.karla(
                        
                        fontSize: 32,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                  
                  SizedBox(height: 30),
                  _textField(
                    _email,
                    "Username",
                    Icon(Icons.account_box),
                  ),
                  SizedBox(height: 44),
                  _textField(
                    _password,
                    "Password",
                    Icon(Icons.lock),
                  ),
                  SizedBox(height: 32),
                  Mutation(
                    options: MutationOptions(document: gql(loginQuery)),
                    builder: (run, _) => ElevatedButton(
                      onPressed: () async {
                        await onSubmit(run);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff6367EA),
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      ),
                      child: Text("Login", style: GoogleFonts.karla(),),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(height: 16),
                  Text("Don't have an Account?" , style: GoogleFonts.karla(),),
                  SizedBox(height: 16),
                  Container(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.karla(
                          color: Color(0xff6367EA),
                          fontWeight: FontWeight.bold),
                    ),
                  )),
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
      style:  GoogleFonts.karla(),
      decoration: InputDecoration(
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
