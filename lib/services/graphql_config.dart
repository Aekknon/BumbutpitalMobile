import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:shared_preferences/shared_preferences.dart';

class GraphQLConfiguration extends ChangeNotifier {
  Link? link = null;
  HttpLink httpLink = HttpLink(
    "http://10.0.2.2:3001/graphql",
  );
  bool isAuth = false;

  Future<void> fetchToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;
    if (token != null && token.isNotEmpty) {
      isAuth = true;
      setToken(token);
      notifyListeners();
    }
  }

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', "");
    isAuth = false;
    removeToken();
    notifyListeners();
  }

  Future<void> setToken(String token) async {
    AuthLink alink = AuthLink(getToken: () async => 'Bearer ' + token);
    link = alink.concat(httpLink);
    isAuth = true;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    notifyListeners();
  }

  void removeToken() {
    link = null;
  }

  Link getLink() {
    return link != null ? link! : httpLink;
  }

  ValueNotifier<GraphQLClient> clientToQuery() {
    return ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(store: InMemoryStore()),
        link: getLink(),
      ),
    );
  }
}
