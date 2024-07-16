import 'package:flutter/material.dart';
import 'package:wemolo_challenge/data/models/parking_lot.dart';
import 'package:wemolo_challenge/domain/usecases/fetch_parking_lots.dart';

class ParkingLotProvider with ChangeNotifier {
  final FetchParkingLots fetchParkingLots;

  ParkingLotProvider(this.fetchParkingLots);

  List<ParkingLotModel> _parkingLots = [];
  List<ParkingLotModel> _goodParkingLots = [];
  List<ParkingLotModel> _badParkingLots = [];
  int _offset = 0;
  String? _errorMessage;
  bool _hasMore = true;

  List<ParkingLotModel> get parkingLots => _parkingLots;
  List<ParkingLotModel> get goodParkingLots => _goodParkingLots;
  List<ParkingLotModel> get badParkingLots => _badParkingLots;
  String? get errorMessage => _errorMessage;
  bool get hasMore => _hasMore;

  Future<void> fetchParkingLotsData() async {
    if (!_hasMore) return;

    try {
      final result = await fetchParkingLots.execute(5, _offset);
      if (result.isEmpty) {
        _hasMore = false;
      } else {
        _parkingLots.addAll(result);
        _offset += 5;
      }
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    }
    notifyListeners();
  }

  void addGoodParkingLot(ParkingLotModel lot) {
    _goodParkingLots.add(lot);
    _parkingLots.remove(lot);
    notifyListeners();
  }

  void addBadParkingLot(ParkingLotModel lot) {
    _badParkingLots.add(lot);
    _parkingLots.remove(lot);
    notifyListeners();
  }

  void setParkingLots(List<ParkingLotModel> lots) {
    _parkingLots = lots;
    notifyListeners();
  }
}
