// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartDataModelAdapter extends TypeAdapter<CartDataModel> {
  @override
  final int typeId = 1;

  @override
  CartDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartDataModel(
      orderId: fields[0] as String?,
      priceOrder: fields[1] as num?,
      cartData: (fields[2] as List?)?.cast<CartModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, CartDataModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.orderId)
      ..writeByte(1)
      ..write(obj.priceOrder)
      ..writeByte(2)
      ..write(obj.cartData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
