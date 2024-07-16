import 'package:mockito/annotations.dart';
import 'package:wemolo_challenge/core/graphql/graphql_service.dart';
import 'package:wemolo_challenge/data/repositories/parking_lot_repository_impl.dart';

@GenerateMocks([GraphQLService, ParkingLotRepositoryImpl])
void main() {}
