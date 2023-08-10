// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartModelAdapter extends TypeAdapter<CartModel> {
  @override
  final int typeId = 0;

  @override
  CartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartModel(
      name: fields[1] as String?,
      image: fields[2] as String?,
      price: fields[3] as String?,
      quantity: fields[4] as String?,
      size: fields[5] as String?,
      subName: fields[6] as String?,
    )..id = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, CartModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.size)
      ..writeByte(6)
      ..write(obj.subName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;






}


_$CartModelFromJson(Map<String, dynamic> json) {
  return CartModel(
    id: json['id'] as String?,
    name: json['name'] as String?,
    image: json['image'] as String?,
    price: json['price'] as String?,
    quantity: json['quantity'] as String?,
    size: json['size'] as String?,
    subName: json['subName'] as String?,
  );
}

Map<String, dynamic> _$CartModelToJson(CartModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'quantity': instance.quantity,
      'size': instance.size,
      'subName': instance.subName,
    };

