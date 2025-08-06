// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PickupAdapter extends TypeAdapter<Pickup> {
  @override
  final int typeId = 0;

  @override
  Pickup read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pickup(
      id: fields[0] as String,
      patientName: fields[1] as String,
      address: fields[2] as String,
      contact: fields[3] as String,
      scheduledTime: fields[4] as DateTime,
      status: fields[5] as PickupStatus,
      stages: (fields[6] as List?)?.cast<SampleStage>(),
    );
  }

  @override
  void write(BinaryWriter writer, Pickup obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.patientName)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.contact)
      ..writeByte(4)
      ..write(obj.scheduledTime)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.stages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PickupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PickupStatusAdapter extends TypeAdapter<PickupStatus> {
  @override
  final int typeId = 1;

  @override
  PickupStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PickupStatus.pending;
      case 1:
        return PickupStatus.inProgress;
      case 2:
        return PickupStatus.collected;
      case 3:
        return PickupStatus.delivered;
      default:
        return PickupStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, PickupStatus obj) {
    switch (obj) {
      case PickupStatus.pending:
        writer.writeByte(0);
        break;
      case PickupStatus.inProgress:
        writer.writeByte(1);
        break;
      case PickupStatus.collected:
        writer.writeByte(2);
        break;
      case PickupStatus.delivered:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PickupStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SampleStageAdapter extends TypeAdapter<SampleStage> {
  @override
  final int typeId = 2;

  @override
  SampleStage read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SampleStage.scheduled;
      case 1:
        return SampleStage.inTransit;
      case 2:
        return SampleStage.collected;
      case 3:
        return SampleStage.delivered;
      default:
        return SampleStage.scheduled;
    }
  }

  @override
  void write(BinaryWriter writer, SampleStage obj) {
    switch (obj) {
      case SampleStage.scheduled:
        writer.writeByte(0);
        break;
      case SampleStage.inTransit:
        writer.writeByte(1);
        break;
      case SampleStage.collected:
        writer.writeByte(2);
        break;
      case SampleStage.delivered:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SampleStageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
