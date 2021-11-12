
import 'package:bumbutpital/ComponentMainScreen/bottom_navbar.dart';
import 'package:bumbutpital/ContentPage/content_detail.dart';
import 'package:bumbutpital/HospitalPage/qr_code_screen.dart';
import 'package:bumbutpital/VideoPage/video_detail.dart';
import 'package:bumbutpital/services/graphql_config.dart';
import 'package:bumbutpital/HospitalPage/hospital_detail.dart';
import 'package:bumbutpital/HospitalPage/keep_koopong_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Questionare/show_result.dart';
import 'splash_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';


Future main() async {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GraphQLConfiguration(),
      child:
          Consumer<GraphQLConfiguration>(builder: (context, graphQLConfig, _) {
        return GraphQLProvider(
          client: graphQLConfig.clientToQuery(),
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              // home: graphQLConfig.isAuth ? BottomNavBar() : SplashScreen(),
              home: SplashScreen(),
              routes: {
                ShowResult.routeName: (_) => ShowResult(),
                "/ContentDetail": (_) => ContentDetail(),
                "/HospitalDetail": (_) => HospitalDetail(),
                "/PromotionInHospitalDetail": (_) => KeepkoopongPage(),
                "/VideoDetail": (_) => VideoDetail(),
                 "/QRCodePage": (_) => QRCodePage(),
                "/CurrentPromotionInHospitalDetail": (_) => KeepCurrentKoopongPage(),
              }),
        );
      }),
    );
  }
}
