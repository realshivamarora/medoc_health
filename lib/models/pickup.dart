import 'package:hive/hive.dart';

part 'pickup.g.dart';

@HiveType(typeId: 0)
class Pickup extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String patientName;

  @HiveField(2)
  String address;

  @HiveField(3)
  String contact;

  @HiveField(4)
  DateTime scheduledTime;

  @HiveField(5)
  PickupStatus status;

  @HiveField(6)
  List<SampleStage> stages;

  Pickup({
    required this.id,
    required this.patientName,
    required this.address,
    required this.contact,
    required this.scheduledTime,
    this.status = PickupStatus.pending,
    List<SampleStage>? stages,
  }) : stages = stages ?? [SampleStage.scheduled];
}

@HiveType(typeId: 1)
enum PickupStatus {
  @HiveField(0)
  pending,
  @HiveField(1)
  inProgress,
  @HiveField(2)
  collected,
  @HiveField(3)
  delivered,
}

@HiveType(typeId: 2)
enum SampleStage {
  @HiveField(0)
  scheduled,
  @HiveField(1)
  inTransit,
  @HiveField(2)
  collected,
  @HiveField(3)
  delivered,
}
