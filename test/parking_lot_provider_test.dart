import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wemolo_challenge/data/models/parking_lot.dart';
import 'package:wemolo_challenge/domain/usecases/fetch_parking_lots.dart';
import 'package:wemolo_challenge/presentation/providers/parking_lot_provider.dart';
import 'mock_classes.mocks.dart';

void main() {
  group('ParkingLotProvider Tests', () {
    late MockParkingLotRepositoryImpl mockRepository;
    late ParkingLotProvider provider;

    setUp(() {
      mockRepository = MockParkingLotRepositoryImpl();
      provider = ParkingLotProvider(FetchParkingLots(mockRepository));
    });

    test('fetchParkingLotsData fetches and updates parking lots', () async {
      final parkingLots = [
        ParkingLotModel(
          id: '1',
          name: 'Test Lot 1',
          address: '123 Test St',
          status: 'active',
          liveDate: '2021-01-01',
          type: 'type',
          size: 100,
          image: 'http://example.com/image1.jpg',
        ),
        ParkingLotModel(
          id: '2',
          name: 'Test Lot 2',
          address: '456 Test St',
          status: 'inactive',
          liveDate: '2021-02-01',
          type: 'type',
          size: 200,
          image: 'http://example.com/image2.jpg',
        ),
      ];

      when(mockRepository.fetchParkingLots(5, 0))
          .thenAnswer((_) async => parkingLots);

      await provider.fetchParkingLotsData();

      expect(provider.parkingLots, parkingLots);
      verify(mockRepository.fetchParkingLots(5, 0)).called(1);
    });

    test(
        'addGoodParkingLot adds to goodParkingLots and removes from parkingLots',
        () {
      final parkingLot = ParkingLotModel(
        id: '1',
        name: 'Test Lot 1',
        address: '123 Test St',
        status: 'active',
        liveDate: '2021-01-01',
        type: 'type',
        size: 100,
        image: 'http://example.com/image1.jpg',
      );

      provider.setParkingLots([parkingLot]);
      provider.addGoodParkingLot(parkingLot);

      expect(provider.goodParkingLots, contains(parkingLot));
      expect(provider.parkingLots, isNot(contains(parkingLot)));
    });

    test('addBadParkingLot adds to badParkingLots and removes from parkingLots',
        () {
      final parkingLot = ParkingLotModel(
        id: '1',
        name: 'Test Lot 1',
        address: '123 Test St',
        status: 'active',
        liveDate: '2021-01-01',
        type: 'type',
        size: 100,
        image: 'http://example.com/image1.jpg',
      );

      provider.setParkingLots([parkingLot]);
      provider.addBadParkingLot(parkingLot);

      expect(provider.badParkingLots, contains(parkingLot));
      expect(provider.parkingLots, isNot(contains(parkingLot)));
    });
  });
}
