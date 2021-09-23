import 'package:bumbutpital/ContentPage/content_detail.dart';
import 'package:bumbutpital/services/graphql_config.dart';
import 'package:flutter/material.dart';
import 'Questionare/show_result.dart';
import 'splash_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _graphqlConfig = GraphQLConfiguration();
    return GraphQLProvider(
      client: _graphqlConfig.client,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          //use MaterialApp() widget like this
          home: SplashScreen(), //create new widget class for this 'home' to
          routes: {
            ShowResult.routeName: (_) => ShowResult(),
            "/ContentDetail": (_) => ContentDetail()
          }
          // escape 'No MediaQuery widget found' error
          ),
    );
  }
}
