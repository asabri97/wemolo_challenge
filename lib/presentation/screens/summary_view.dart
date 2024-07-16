import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wemolo_challenge/presentation/providers/parking_lot_provider.dart';
import 'package:wemolo_challenge/presentation/widgets/parking_lot_list.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    final parkingLotProvider = Provider.of<ParkingLotProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Summary', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ParkingLotList(
              title: 'Good Parking Lots',
              parkingLots: parkingLotProvider.goodParkingLots,
            ),
            ParkingLotList(
              title: 'Bad Parking Lots',
              parkingLots: parkingLotProvider.badParkingLots,
            ),
          ],
        ),
      ),
    );
  }
}
