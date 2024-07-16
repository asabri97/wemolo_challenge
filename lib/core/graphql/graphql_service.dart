import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  final String apiUrl = 'https://interview-apixx07.dev.park-depot.de/graphql';

  GraphQLClient getClient() {
    final HttpLink httpLink = HttpLink(apiUrl);

    return GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: httpLink,
    );
  }

  Future<QueryResult> fetchParkingLots(int limit, int offset) async {
    const String query = """
    query GetAllParkingLots(\$limit: Int, \$offset: Int) {
      getAllParkingLots(limit: \$limit, offset: \$offset) {
        id
        name
        address
        status
        live_date
        type
        size
        image
      }
    }
    """;

    final options = QueryOptions(
      document: gql(query),
      variables: {'limit': limit, 'offset': offset},
    );

    final result = await getClient().query(options);

    if (result.hasException) {
      debugPrint("GraphQL Exception: ${result.exception.toString()}");
    } else {
      debugPrint("GraphQL Data: ${result.data}");
    }

    return result;
  }
}
