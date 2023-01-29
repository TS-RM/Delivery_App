// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealModelAdapter extends TypeAdapter<MealModel> {
  @override
  final int typeId = 5;

  @override
  MealModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      image: fields[3] as String?,
      rating: fields[4] as num?,
      price: fields[5] as int?,
      calories: fields[6] as int?,
      description: fields[2] as String?,
      addedDate: fields[8] as DateTime?,
      option: fields[10] as String?,
      status: fields[7] as int?,
      userId: fields[9] as String?,
      category: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MealModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.calories)
      ..writeByte(7)
      ..write(obj.status)
      ..writeByte(8)
      ..write(obj.addedDate)
      ..writeByte(9)
      ..write(obj.userId)
      ..writeByte(10)
      ..write(obj.option)
      ..writeByte(11)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
