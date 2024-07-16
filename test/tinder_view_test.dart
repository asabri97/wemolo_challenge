import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:wemolo_challenge/data/models/parking_lot.dart';
import 'package:wemolo_challenge/presentation/providers/parking_lot_provider.dart';
import 'package:wemolo_challenge/presentation/screens/tinder_view.dart';
import 'package:wemolo_challenge/domain/usecases/fetch_parking_lots.dart';
import 'mock_classes.mocks.dart';

void main() {
  testWidgets('TinderView displays UI elements correctly',
      (WidgetTester tester) async {
    final mockRepository = MockParkingLotRepositoryImpl();
    final provider = ParkingLotProvider(FetchParkingLots(mockRepository));

    when(mockRepository.fetchParkingLots(any, any)).thenAnswer((_) async {
      return [
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
      ];
    });

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ParkingLotProvider>.value(value: provider),
        ],
        child: const MaterialApp(
          home: TinderView(),
        ),
      ),
    );

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Wemolo'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pump();
    await tester.pump(Duration.zero);
  });
}
