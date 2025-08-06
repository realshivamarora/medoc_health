import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pickup_provider.dart';
import '../models/pickup.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pickups = Provider.of<PickupProvider>(context).todayPickups;

    int total = pickups.length;
    int collected = pickups.where((p) => p.status == PickupStatus.collected).length;
    int delivered = pickups.where((p) => p.status == PickupStatus.delivered).length;
    int pending = pickups.where((p) => p.status == PickupStatus.pending).length;
    int inProgress = pickups.where((p) => p.status == PickupStatus.inProgress).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('End of Day Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatTile("🗓️ Total Pickups", total),
            _buildStatTile("🧪 Collected", collected),
            _buildStatTile("🚚 Delivered", delivered),
            _buildStatTile("⌛ In Progress", inProgress),
            _buildStatTile("❌ Pending", pending),
            const SizedBox(height: 20),
            const Text(
              "✅ Great job today!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatTile(String title, int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: ListTile(
        tileColor: Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: Text(count.toString(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
