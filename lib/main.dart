import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wemolo_challenge/presentation/providers/parking_lot_provider.dart';
import 'package:wemolo_challenge/presentation/screens/tinder_view.dart';
import 'package:wemolo_challenge/data/repositories/parking_lot_repository_impl.dart';
import 'package:wemolo_challenge/core/graphql/graphql_service.dart';
import 'package:wemolo_challenge/domain/usecases/fetch_parking_lots.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ParkingLotProvider(
            FetchParkingLots(
              ParkingLotRepositoryImpl(
                GraphQLService(),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wemolo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontFamily: 'AlbertSans'),
            displayMedium: TextStyle(fontFamily: 'AlbertSans'),
            displaySmall: TextStyle(fontFamily: 'AlbertSans'),
            headlineLarge: TextStyle(
                fontFamily: 'AlbertSans', fontWeight: FontWeight.bold),
            headlineMedium: TextStyle(
                fontFamily: 'AlbertSans', fontWeight: FontWeight.bold),
            headlineSmall: TextStyle(
                fontFamily: 'AlbertSans', fontWeight: FontWeight.bold),
            titleLarge: TextStyle(
                fontFamily: 'AlbertSans', fontWeight: FontWeight.bold),
            titleMedium: TextStyle(
                fontFamily: 'AlbertSans', fontWeight: FontWeight.bold),
            titleSmall: TextStyle(
                fontFamily: 'AlbertSans', fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(fontFamily: 'AlbertSans'),
            bodyMedium: TextStyle(fontFamily: 'AlbertSans'),
            bodySmall: TextStyle(fontFamily: 'AlbertSans'),
            labelLarge: TextStyle(fontFamily: 'AlbertSans'),
          ),
        ),
        home: const TinderView(),
      ),
    );
  }
}
