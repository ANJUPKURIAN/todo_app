// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActionModelAdapter extends TypeAdapter<ActionModel> {
  @override
  final int typeId = 1;

  @override
  ActionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActionModel(
      action: fields[0] as String,
      finished: fields[1] as bool,
      category: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ActionModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.action)
      ..writeByte(1)
      ..write(obj.finished)
      ..writeByte(2)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
