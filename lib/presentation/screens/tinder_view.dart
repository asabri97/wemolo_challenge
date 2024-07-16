import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:wemolo_challenge/presentation/providers/parking_lot_provider.dart';
import 'package:wemolo_challenge/presentation/screens/summary_view.dart';
import 'package:wemolo_challenge/presentation/widgets/parking_lot_card.dart';

class TinderView extends StatefulWidget {
  const TinderView({super.key});

  @override
  TinderViewState createState() => TinderViewState();
}

class TinderViewState extends State<TinderView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final parkingLotProvider = Provider.of<ParkingLotProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Wemolo', style: Theme.of(context).textTheme.titleLarge),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SummaryView()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: parkingLotProvider.fetchParkingLotsData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || parkingLotProvider.errorMessage != null) {
            return Center(
              child: Text(
                'Error fetching parking lots: ${parkingLotProvider.errorMessage}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }

          if (parkingLotProvider.parkingLots.isEmpty) {
            return Center(
                child: Text('No parking lots available',
                    style: Theme.of(context).textTheme.bodyLarge));
          }

          return CardSwiper(
            numberOfCardsDisplayed: 3,
            isLoop: false,
            cardsCount: parkingLotProvider.parkingLots.length,
            cardBuilder: (context, index, horizontalOffsetPercentage,
                verticalOffsetPercentage) {
              final parkingLot = parkingLotProvider.parkingLots[index];
              return ParkingLotCard(
                parkingLot: parkingLot,
                onGood: () {
                  parkingLotProvider.addGoodParkingLot(parkingLot);
                },
                onBad: () {
                  parkingLotProvider.addBadParkingLot(parkingLot);
                },
              );
            },
            onEnd: () {
              if (parkingLotProvider.hasMore) {
                parkingLotProvider.fetchParkingLotsData();
              }
            },
            onSwipe: (int index, int? runAnimation,
                CardSwiperDirection direction) async {
              final parkingLot = parkingLotProvider.parkingLots[index];
              if (direction == CardSwiperDirection.right) {
                parkingLotProvider.addGoodParkingLot(parkingLot);
              } else if (direction == CardSwiperDirection.left) {
                parkingLotProvider.addBadParkingLot(parkingLot);
              }
              return true;
            },
            allowedSwipeDirection:
                const AllowedSwipeDirection.only(left: true, right: true),
          );
        },
      ),
    );
  }
}
