import 'package:cloud_firestore/cloud_firestore.dart';

class AllProductModel{
    String? image;
  String? productName;
  int? price;
  String? quantity;
  String? category;
  String? discription;
  String? uid;

  AllProductModel({
     this.image,
     this.productName,
     this.price,
     this.quantity,
     this.category,
     this.discription,
     this.uid,

  });

  Map<String, dynamic> ProductToJson() => {
        "ProductImage": image,
        "productName": productName,
        "Price": price,
        "Category": category,
        "quantity": quantity,
        "discription": discription,
        "uid": uid
      };

  productFromJson(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
   

    return AllProductModel(
        image: snapshot["ProductImage"],
        productName: snapshot["productName"],
        price: snapshot["Price"],
        quantity: snapshot["quantity"],
        category: snapshot["Category"],
        discription: snapshot["discription"],
        uid: snapshot["uid"]
        
        );
  }
}