import 'package:wemolo_challenge/domain/entities/parking_lot_entity.dart';

class ParkingLotModel extends ParkingLotEntity {
  ParkingLotModel({
    required super.id,
    required super.name,
    required super.address,
    required super.status,
    required super.liveDate,
    required super.type,
    required super.size,
    required super.image,
  });

  factory ParkingLotModel.fromJson(Map<String, dynamic> json) {
    return ParkingLotModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      status: json['status'] ?? '',
      liveDate: json['live_date'] ?? '',
      type: json['type'] ?? '',
      size: json['size'] ?? 0,
      image: json['image'] ?? '',
    );
  }
}
