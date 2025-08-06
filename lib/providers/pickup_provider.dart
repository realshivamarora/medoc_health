import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/pickup.dart';
import 'package:uuid/uuid.dart';

class PickupProvider extends ChangeNotifier {
  final Box<Pickup> _pickupBox = Hive.box<Pickup>('pickups');
  final Uuid _uuid = const Uuid();

  List<Pickup> get todayPickups {
    final today = DateTime.now();
    return _pickupBox.values
        .where((p) =>
            p.scheduledTime.year == today.year &&
            p.scheduledTime.month == today.month &&
            p.scheduledTime.day == today.day)
        .toList();
  }

  void addPickup(Pickup pickup) {
    _pickupBox.put(pickup.id, pickup);
    notifyListeners();
  }

  void generateMockData() {
    if (_pickupBox.isEmpty) {
      List<Pickup> mockList = [
        Pickup(
          id: _uuid.v4(),
          patientName: "Shivam Arora",
          address: "Kapurthala, Punjab",
          contact: "9876543210",
          scheduledTime: DateTime.now().add(const Duration(hours: 2)),
          status: PickupStatus.pending,
          stages: [SampleStage.scheduled],
        ),
        Pickup(
          id: _uuid.v4(),
          patientName: "Virat Kohli",
          address: "Delhi",
          contact: "9999999999",
          scheduledTime: DateTime.now().add(const Duration(hours: 3)),
          status: PickupStatus.inProgress,
          stages: [SampleStage.scheduled, SampleStage.inTransit],
        ),
        Pickup(
          id: _uuid.v4(),
          patientName: "Rohit Sharma",
          address: "Mumbai",
          contact: "9123456789",
          scheduledTime: DateTime.now().add(const Duration(hours: 4)),
          status: PickupStatus.pending,
          stages: [SampleStage.scheduled],
        ),
      ];

      for (var pickup in mockList) {
        _pickupBox.put(pickup.id, pickup);
      }

      notifyListeners();
    }
  }

  void updateStatus(String id, PickupStatus status) {
    final pickup = _pickupBox.get(id);
    if (pickup != null) {
      pickup.status = status;

      if (status == PickupStatus.collected &&
          !pickup.stages.contains(SampleStage.collected)) {
        pickup.stages.add(SampleStage.collected);
      }

      pickup.save();
      notifyListeners();
    }
  }

  void advanceStage(String id) {
    final pickup = _pickupBox.get(id);
    if (pickup != null) {
      final currentIndex = pickup.stages.length - 1;
      if (currentIndex < SampleStage.values.length - 1) {
        pickup.stages.add(SampleStage.values[currentIndex + 1]);
        pickup.save();
        notifyListeners();
      }
    }
  }

  void reportIssue(String id, String issueDescription) {
    debugPrint('Issue reported for $id: $issueDescription');
    // You can later enhance this to store offline issues in Hive
  }
}
