import 'package:flutter/material.dart';
import 'package:wemolo_challenge/core/graphql/graphql_service.dart';
import 'package:wemolo_challenge/data/models/parking_lot.dart';
import 'package:wemolo_challenge/domain/repositories/parking_lot_repository.dart';

class ParkingLotRepositoryImpl implements ParkingLotRepository {
  final GraphQLService graphqlService;

  ParkingLotRepositoryImpl(this.graphqlService);

  @override
  Future<List<ParkingLotModel>> fetchParkingLots(int limit, int offset) async {
    final result = await graphqlService.fetchParkingLots(limit, offset);
    if (result.hasException) {
      debugPrint(
          "Repository: GraphQL Exception: ${result.exception.toString()}");
      throw result.exception!;
    }

    final List<dynamic>? data = result.data?['getAllParkingLots'];
    if (data == null) {
      debugPrint("Repository: No data returned");
      return [];
    }

    debugPrint("Repository: Data fetched successfully");
    return data.map((json) => ParkingLotModel.fromJson(json)).toList();
  }
}
