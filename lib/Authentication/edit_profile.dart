// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  static const mutation = """
      mutation (\$name:String!,\$surname: String!,\$email: String!,\$phoneNumber: String!) {
      editprofile(name:\$name,surname:\$surname,email:\$email,phoneNumber:\$phoneNumber){
       successful
    message
      }
    }
                        """;

  static const query = """
                   query {
    getCurrentUser {
     
       name
    surname
    email
    phoneNumber
    appropiatePHQSeverity
  phq9permission

    }
  }
                  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFECF2FF),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0XFFECF2FF),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          title: Text(
            "EDIT PROFILE",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Query(
          options: QueryOptions(document: gql(query)),
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
            final _email = TextEditingController(text:  result.data!['getCurrentUser'][0]['email']);
            final _Name = TextEditingController(text:  result.data!['getCurrentUser'][0]['name']);
            final _surName = TextEditingController(text:  result.data!['getCurrentUser'][0]['surname']);
            final _phoneNumber = TextEditingController(text:  result.data!['getCurrentUser'][0]['phoneNumber']);
            Future<void> onSubmit(RunMutation run) async {
              try {
                final response = run({
                  "email": _email.text,
                  "name": _Name.text,
                  "surname": _surName.text,
                  "phoneNumber": _phoneNumber.text,
                });

                Navigator.pop(context, 'OK');
              } catch (err) {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Error!'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: const <Widget>[
                            Text('Insert your email,name,surname,phone number'),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }

            return SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfile()));
                      },
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6yT-obMdemGbSctinso7rd-tJGyxHhnxetinsg4Nwj2Va1nbirK_lT9wy2KEqIiAMjkw&usqp=CAU'),
                        radius: 60,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 300,
                      child: _textField(
                        _Name,
                        result.data!['getCurrentUser'][0]['name'],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 300,
                      child: _textField(
                        _surName,
                        result.data!['getCurrentUser'][0]['surname'],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 300,
                      child: _textField(
                        _email,
                        result.data!['getCurrentUser'][0]['email'],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 300,
                      child: _textField(
                        _phoneNumber,
                        result.data!['getCurrentUser'][0]['phoneNumber'],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Mutation(
                      options: MutationOptions(document: gql(mutation)),
                      builder: (run, _) => ElevatedButton(
                        onPressed: () async {
                          await onSubmit(run);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0XFFFE7940),
                          padding: EdgeInsets.symmetric(
                              horizontal: 100, vertical: 15),
                        ),
                        child: Text("SUBMIT QUESTION"),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }

  TextField _textField(TextEditingController cont, String label) {
    return TextField(
      controller: cont,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      ),
      autocorrect: true,
    );
  }
}
