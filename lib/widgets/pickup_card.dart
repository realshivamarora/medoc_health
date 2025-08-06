import 'package:flutter/material.dart';
import '../models/pickup.dart';
import 'package:provider/provider.dart';
import '../providers/pickup_provider.dart';

class PickupCard extends StatelessWidget {
  final Pickup pickup;

  const PickupCard({super.key, required this.pickup});

  @override
  Widget build(BuildContext context) {
    final pickupProvider = Provider.of<PickupProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(pickup.patientName, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text('📍 ${pickup.address}'),
              Text('📞 ${pickup.contact}'),
              Text('⏰ ${pickup.scheduledTime.hour}:${pickup.scheduledTime.minute.toString().padLeft(2, '0')}'),
              const SizedBox(height: 12),

              // ✅ Wrap toggle in row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Sample Collected"),
                  Switch(
                    value: pickup.status == PickupStatus.collected,
                    onChanged: (val) {
                      pickupProvider.updateStatus(
                          pickup.id,
                          val ? PickupStatus.collected : PickupStatus.inProgress
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
