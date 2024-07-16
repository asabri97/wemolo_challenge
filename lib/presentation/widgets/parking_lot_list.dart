import 'package:flutter/material.dart';
import 'package:wemolo_challenge/data/models/parking_lot.dart';

class ParkingLotList extends StatelessWidget {
  final List<ParkingLotModel> parkingLots;
  final String title;

  const ParkingLotList({
    super.key,
    required this.parkingLots,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: parkingLots.length,
          itemBuilder: (context, index) {
            final parkingLot = parkingLots[index];
            return ListTile(
              title: Text(parkingLot.name,
                  style: Theme.of(context).textTheme.bodyMedium),
              subtitle: Text(parkingLot.address,
                  style: Theme.of(context).textTheme.bodySmall),
              leading: Image.network(parkingLot.image,
                  width: 50, height: 50, fit: BoxFit.cover),
            );
          },
        ),
      ],
    );
  }
}
