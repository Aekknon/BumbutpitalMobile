import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfiguration {
  static Link? link = null;
  static HttpLink httpLink = HttpLink(
    "http://10.0.2.2:3001/graphql",
  );
  static void setToken(String token) {
    AuthLink alink = AuthLink(getToken: () async => 'Bearer ' + token);
    GraphQLConfiguration.link = alink.concat(GraphQLConfiguration.httpLink);
  }

  static void removeToken() {
    GraphQLConfiguration.link = null;
  }

  static Link getLink() {
    return GraphQLConfiguration.link != null
        ? GraphQLConfiguration.link!
        : GraphQLConfiguration.httpLink;
  }

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: getLink(),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: getLink(),
    );
  }
}
