
import 'package:bumbutpital/Authentication/all_graph.dart';
import 'package:bumbutpital/ContentPage/content_detail.dart';
import 'package:bumbutpital/Forum/forum_page/forum_page.dart';
import 'package:bumbutpital/Forum/forum_page/my_forum_page.dart';
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
import 'package:bumbutpital/Authentication/all_graph.dart';



void main() {
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
                ShowResult.routeName:  (_) => ShowResult(),
                "/ContentDetail": (_) => ContentDetail(),
                "/HospitalDetail": (_) => HospitalDetail(),
                "/PromotionInHospitalDetail": (_) => KeepkoopongPage(),
                "/VideoDetail": (_) => VideoDetail(),
                 "/QRCodePage": (_) => QRCodePage(),
                "/CurrentPromotionInHospitalDetail": (_) => KeepCurrentKoopongPage(),
                 "/AllGraph": (_) => AllGraph(),
                 "/MyForum": (_) => MyForumPage(),
              }),
        );
      }),
    );
  }
}
