import 'package:wemolo_challenge/data/models/parking_lot.dart';

abstract class ParkingLotRepository {
  Future<List<ParkingLotModel>> fetchParkingLots(int limit, int offset);
}
