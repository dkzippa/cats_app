// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryRecordAdapter extends TypeAdapter<HistoryRecord> {
  @override
  final int typeId = 0;

  @override
  HistoryRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryRecord(
      text: fields[0] as String,
      createdAt: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryRecord obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
