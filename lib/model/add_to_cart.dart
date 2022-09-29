
class AddtoCart {
  final String image;
  final String id;
  final String name;
  final int price;
  final int quantity;

  AddtoCart(
      {required this.image,
        required this.id,
      required this.name,
      required this.price,
     required  this.quantity});

  Map<String, dynamic> toJson() {
    return {
      "image":image,
      "id": id,
      "name": name,
      "price": price,
      "quantity": quantity,
    };
  }

  static AddtoCart fromJson(Map<String, dynamic> json) {
    return AddtoCart(
      image:json["image"],
        id: json["id"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"]);
  }
}