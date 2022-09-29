import 'package:cloud_firestore/cloud_firestore.dart';

class AllProductModel {
  String? image;
  String? productName;
  int? price;
  int? quantity;
  String? category;
  String? discription;
  String? documentID;
  bool? available;

  AllProductModel(
      {this.image,
      this.productName,
      this.price,
      this.quantity,
      this.category,
      this.discription,
      this.documentID,
      this.available});

  Map<String, dynamic> productToJson() => {
        "ProductImage": image,
        "productName": productName,
        "Price": price,
        "Category": category,
        "quantity": quantity,
        "discription": discription,
        "documentID": documentID,
        "available": available,
      };

  productFromJson(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    // var snapshotData = snapshot as  Map<String, dynamic>;

    return AllProductModel(
        image: snapshot["ProductImage"],
        productName: snapshot["productName"],
        price: snapshot["Price"],
        quantity: snapshot["quantity"],
        category: snapshot["Category"],
        discription: snapshot["discription"],
        documentID: snapshot["documentID"],
        available: snapshot["available"]);
  }
}
