import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/pickup.dart';
import 'providers/pickup_provider.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(PickupStatusAdapter());
  Hive.registerAdapter(SampleStageAdapter()); // ← Add this
  Hive.registerAdapter(PickupAdapter());

  await Hive.openBox<Pickup>('pickups');

  await Hive.box<Pickup>('pickups').clear(); // Optional: Clears old data

  runApp(const SamplePickupApp());
}


class SamplePickupApp extends StatelessWidget {
  const SamplePickupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PickupProvider(),
      child: MaterialApp(
        title: 'Sample Pickup App',
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: const HomeScreen(),
      ),
    );
  }
}
