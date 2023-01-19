// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserHiveModelAdapter extends TypeAdapter<UserHiveModel> {
  @override
  final int typeId = 0;

  @override
  UserHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserHiveModel()
      ..id = fields[0] as String?
      ..firstName = fields[1] as String?
      ..lastName = fields[2] as String?
      ..email = fields[3] as String?
      ..phoneNumber = fields[4] as String?
      ..image = fields[5] as String?
      ..gender = fields[6] as int?
      ..address = fields[7] as String?
      ..moneyAccount = fields[8] as String?
      ..userType = fields[9] as int?;
  }

  @override
  void write(BinaryWriter writer, UserHiveModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.phoneNumber)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.address)
      ..writeByte(8)
      ..write(obj.moneyAccount)
      ..writeByte(9)
      ..write(obj.userType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
