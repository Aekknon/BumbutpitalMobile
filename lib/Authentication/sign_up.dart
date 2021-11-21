// ignore_for_file: use_key_in_widget_constructors
import 'package:bumbutpital/Authentication/Login.dart';
import 'package:bumbutpital/Questionare/main_question.dart';
import 'package:bumbutpital/services/graphql_config.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUp> {
  static const query = """
                   query {
    onlyusername {
     
     username
      
    }
  }
                  """;
  static const registerMutation = """
      mutation UserRegister(\$username: String!,\$name:String!,\$surname: String!,\$password:String!,\$email: String!,\$phoneNumber: String!) {
      userRegister(username: \$username,name:\$name,surname:\$surname,password: \$password,email:\$email,phoneNumber:\$phoneNumber){
        username
        name
        surname
        password
        email
        phoneNumber
      }
    }
                        """;
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _Name = TextEditingController();
  final _surName = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _graphqlConfig = GraphQLConfiguration();
  var isPasswordHidden = true;
  var isRemember = true;
  String _error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFECF2FF),
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
          Future ErrorDialog() async {
            return await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(
                    "This username already used please use another username"),
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

          Future ErrorDialog1() async {
            return await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text("Please sumbit all of text field Please"),
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
            if (result.data!['onlyusername'][0]['username'] != null) {
              for (var i = 0; i < result.data!['onlyusername'].length; i++) {
                if (_username.text ==
                    result.data!['onlyusername'][i]['username']) {
                  return await ErrorDialog();
                }
              }
            }
            if (_username.text.isEmpty ||
                _email.text.isEmpty ||
                _password.text.isEmpty ||
                _Name.text.isEmpty ||
                _surName.text.isEmpty ||
                _phoneNumber.text.isEmpty) {
              return await ErrorDialog1();
            }
            try {
              final response = run({
                "username": _username.text,
                "email": _email.text,
                "password": _password.text,
                "name": _Name.text,
                "surname": _surName.text,
                "phoneNumber": _phoneNumber.text,
              });
              print((await response.networkResult) as dynamic);

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
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
                          Text(
                              'Insert your email,password,name,surname,phone number'),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }

          return SafeArea(
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
                      SizedBox(height: 20),
                      _textField(
                        _username,
                        "Username",
                      ),
                      SizedBox(height: 20),
                      _textField(
                        _Name,
                        "Full Name",
                      ),
                      SizedBox(height: 20),
                      _textField(
                        _surName,
                        "Surname",
                      ),
                      SizedBox(height: 20),
                      _textField(
                        _email,
                        "Email",
                      ),
                      SizedBox(height: 20),
                      _textField(
                        _password,
                        "Password",
                      ),
                      SizedBox(height: 20),
                      _textField(
                        _phoneNumber,
                        "Phone Number",
                      ),
                      SizedBox(height: 20),
                      Mutation(
                        options:
                            MutationOptions(document: gql(registerMutation)),
                        builder: (run, _) => ElevatedButton(
                          onPressed: () async {
                            await onSubmit(run);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff6367EA),
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 15),
                          ),
                          child: Text("REGISTER"),
                        ),
                      )
                    ]),
              ),
            ),
          );
        },
      ),
    );
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
