import 'package:bumbutpital/ContentPage/content_detail.dart';
import 'package:flutter/material.dart';
import 'Questionare/show_result.dart';
import 'splash_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


  
import 'dart:io';

void main() {
  final HttpLink httpLink = HttpLink("http://192.168.1.11:3001/graphql");
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );
  var app = GraphQLProvider(client: client, child: MyApp());
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //use MaterialApp() widget like this
        home: SplashScreen(), //create new widget class for this 'home' to
        routes: {
          ShowResult.routeName: (_) => ShowResult(),
          "/ContentDetail": (_) => ContentDetail()
        }
        // escape 'No MediaQuery widget found' error
        );
  }
}


  
