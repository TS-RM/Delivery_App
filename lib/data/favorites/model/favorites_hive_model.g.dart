// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoritesHiveModelAdapter extends TypeAdapter<FavoritesHiveModel> {
  @override
  final int typeId = 4;

  @override
  FavoritesHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoritesHiveModel(
      id: fields[0] as String?,
      mealModel: fields[2] as MealModel?,
      userID: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FavoritesHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userID)
      ..writeByte(2)
      ..write(obj.mealModel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritesHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
