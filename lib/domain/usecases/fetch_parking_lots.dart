import 'package:wemolo_challenge/data/models/parking_lot.dart';
import 'package:wemolo_challenge/domain/repositories/parking_lot_repository.dart';

class FetchParkingLots {
  final ParkingLotRepository repository;

  FetchParkingLots(this.repository);

  Future<List<ParkingLotModel>> execute(int limit, int offset) {
    return repository.fetchParkingLots(limit, offset);
  }
}
