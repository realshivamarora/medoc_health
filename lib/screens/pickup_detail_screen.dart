import 'package:flutter/material.dart';
import '../models/pickup.dart';
import '../widgets/sample_stage_tracker.dart';
import 'package:provider/provider.dart';
import '../providers/pickup_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'report_issue_screen.dart';

class PickupDetailScreen extends StatelessWidget {
  final Pickup pickup;

  const PickupDetailScreen({super.key, required this.pickup});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PickupProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pickup: ${pickup.patientName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📍 Address:', style: Theme.of(context).textTheme.titleMedium),
            Text(pickup.address),
            const SizedBox(height: 8),
            Text('📞 Contact: ${pickup.contact}'),
            const SizedBox(height: 8),
            Text('🕒 Scheduled: ${pickup.scheduledTime}'),
            const Divider(height: 32),

            Text('🧪 Sample Stage Progress',
                style: Theme.of(context).textTheme.titleMedium),
            SampleStageTracker(stages: pickup.stages),
            const SizedBox(height: 16),

            ElevatedButton.icon(
              onPressed: () {
                provider.advanceStage(pickup.id);
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Advance Stage'),
            ),
            const SizedBox(height: 16),

            ElevatedButton.icon(
              onPressed: () async {
                final uri = Uri.encodeFull(
                    'https://www.google.com/maps/search/?api=1&query=${pickup.address}');
                if (await canLaunchUrl(Uri.parse(uri))) {
                  await launchUrl(Uri.parse(uri));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Could not open Maps')),
                  );
                }
              },
              icon: const Icon(Icons.navigation),
              label: const Text('Navigate to Location'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),

            const SizedBox(height: 16),

            OutlinedButton.icon(
              icon: const Icon(Icons.report_problem),
              label: const Text("Report Issue"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ReportIssueScreen(pickupId: pickup.id),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
