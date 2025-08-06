import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pickup_provider.dart';
import '../widgets/pickup_card.dart';
import 'summary_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Populate mock data only once
    Future.microtask(() {
      Provider.of<PickupProvider>(context, listen: false).generateMockData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final pickupProvider = Provider.of<PickupProvider>(context);
    final pickups = pickupProvider.todayPickups;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Today\'s Pickups'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics_outlined),
            tooltip: "Today's Summary",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SummaryScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: pickups.isEmpty
            ? const Center(child: Text("No pickups scheduled today."))
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: pickups.length,
                itemBuilder: (ctx, index) {
                  return PickupCard(pickup: pickups[index]);
                },
              ),
      ),
    );
  }
}
