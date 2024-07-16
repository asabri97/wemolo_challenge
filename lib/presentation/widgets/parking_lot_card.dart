import 'package:flutter/material.dart';
import 'package:wemolo_challenge/data/models/parking_lot.dart';

class ParkingLotCard extends StatelessWidget {
  final ParkingLotModel parkingLot;
  final VoidCallback onGood;
  final VoidCallback onBad;

  const ParkingLotCard({
    super.key,
    required this.parkingLot,
    required this.onGood,
    required this.onBad,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15.0)),
              child: Image.network(
                parkingLot.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  parkingLot.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  parkingLot.address,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Status: ${parkingLot.status}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Live Date: ${parkingLot.liveDate}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Type: ${parkingLot.type}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Size: ${parkingLot.size}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_down, color: Colors.red),
                      onPressed: onBad,
                    ),
                    IconButton(
                      icon: const Icon(Icons.thumb_up, color: Colors.green),
                      onPressed: onGood,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
