import 'package:bumbutpital/ComponentMainScreen/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ConsentPage extends StatefulWidget {
  ConsentPage({Key? key}) : super(key: key);

  @override
  _ConsentPageState createState() => _ConsentPageState();
}

class _ConsentPageState extends State<ConsentPage> {
  static const permission = """
      
     mutation(\$permissionPHQSeverity: String! ){
  permissionphq9( permissionPHQSeverity:\$permissionPHQSeverity){
    successful
    message
  }
}
                        """;

  @override
  Widget build(BuildContext context) {
    Future<void> onSubmit(RunMutation run) async {
      try {
        final response = run({
          "permissionPHQSeverity": "y",
        });
        print((await response.networkResult) as dynamic);

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
                    Text('Insert your Question'),
                  ],
                ),
              ),
            );
          },
        );
      }
    }

    return Mutation(
      options: MutationOptions(document: gql(permission)),
      builder: (run, _) => ElevatedButton(
        onPressed: () async {
          await onSubmit(run);
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0XFFFE7940),
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
        ),
        child: Text("SUBMIT QUESTION"),
      ),
    );
  }
}
