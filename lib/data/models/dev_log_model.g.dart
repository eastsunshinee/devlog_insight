// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dev_log_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DevLogModelAdapter extends TypeAdapter<DevLogModel> {
  @override
  final int typeId = 0;

  @override
  DevLogModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DevLogModel(
      id: fields[0] as String,
      message: fields[1] as String,
      createdAt: fields[2] as DateTime,
      mood: fields[3] as String,
      tags: (fields[4] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, DevLogModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.mood)
      ..writeByte(4)
      ..write(obj.tags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DevLogModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
