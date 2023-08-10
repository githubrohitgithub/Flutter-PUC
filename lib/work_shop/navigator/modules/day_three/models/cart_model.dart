import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel extends HiveObject{

  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? image;
  @HiveField(3)
  String? price;
  @HiveField(4)
  String? quantity;
  @HiveField(5)
  String? size;
  @HiveField(6)
  String? subName;
  CartModel({this.id,this.name,this.image, this.price, this.quantity,this.size,this.subName});


  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);


  CartModel copyWith({
    String? id,
    String? name,
    String? image,
    String? price,
    String? quantity,
    String? size,
    String? subName,
  }) {
    return CartModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
      subName: subName ?? this.subName,
    );
  }

}