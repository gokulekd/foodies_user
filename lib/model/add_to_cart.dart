

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddtoCart {
  final String image;
  final String id;
  final String name;
  final int price;
  final int? subTotal;
  final int quantity;
  AddtoCart({
    required this.image,
    required this.id,
    required this.name,
    required this.price,
    this.subTotal,
    required this.quantity,
  });

  AddtoCart copyWith({
    String? image,
    String? id,
    String? name,
    int? price,
    int? subTotal,
    int? quantity,
  }) {
    return AddtoCart(
      image: image ?? this.image,
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      subTotal: subTotal ?? this.subTotal,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'id': id,
      'name': name,
      'price': price,
      'subTotal': subTotal,
      'quantity': quantity,
    };
  }

  factory AddtoCart.fromMap(Map<String, dynamic> map) {
    return AddtoCart(
      image: map['image'] as String,
      id: map['id'] as String,
      name: map['name'] as String,
      price: map['price'] as int,
      subTotal: map['subTotal'] != null ? map['subTotal'] as int : null,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddtoCart.fromJson(String source) => AddtoCart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddtoCart(image: $image, id: $id, name: $name, price: $price, subTotal: $subTotal, quantity: $quantity)';
  }

  @override
  bool operator ==(covariant AddtoCart other) {
    if (identical(this, other)) return true;
  
    return 
      other.image == image &&
      other.id == id &&
      other.name == name &&
      other.price == price &&
      other.subTotal == subTotal &&
      other.quantity == quantity;
  }

  @override
  int get hashCode {
    return image.hashCode ^
      id.hashCode ^
      name.hashCode ^
      price.hashCode ^
      subTotal.hashCode ^
      quantity.hashCode;
  }
}
