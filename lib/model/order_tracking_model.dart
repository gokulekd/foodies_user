
import 'package:meta/meta.dart';
import 'dart:convert';

OrderTrackingModel orderTrackingModelFromJson(String str) => OrderTrackingModel.fromJson(json.decode(str));

String orderTrackingModelToJson(OrderTrackingModel data) => json.encode(data.toJson());

class OrderTrackingModel {
    OrderTrackingModel({
        required this.firebaseDocumentId,
        required this.orderDetails,
        required this.orderConfirmed,
        required this.orderPreparing,
        required this.orderDelivered,
        required this.orderRejected,
        required this.grandTotalAmount,
        required this.paymentTransactionId,
        required this.orderId,
        required this.timeOfOrder,
        required this.customerData,
    });

    String firebaseDocumentId;
    List<OrderDetail> orderDetails;
    bool orderConfirmed;
    bool orderPreparing;
    bool orderDelivered;
    bool orderRejected;
    int grandTotalAmount;
    String paymentTransactionId;
    String orderId;
    String timeOfOrder;
    CustomerData customerData;

    factory OrderTrackingModel.fromJson(Map<String, dynamic> json) => OrderTrackingModel(
        firebaseDocumentId: json["firebaseDocumentID"],
        orderDetails: List<OrderDetail>.from(json["orderDetails"].map((x) => OrderDetail.fromJson(x))),
        orderConfirmed: json["orderConfirmed"],
        orderPreparing: json["orderPreparing "],
        orderDelivered: json["orderDelivered"],
        orderRejected: json["orderRejected"],
        grandTotalAmount: json["grandTotalAmount"],
        paymentTransactionId: json["PaymentTransaction ID"],
        orderId: json["orderID"],
        timeOfOrder: json["timeOfOrder"],
        customerData: CustomerData.fromJson(json["customerData"]),
    );

    Map<String, dynamic> toJson() => {
        "firebaseDocumentID": firebaseDocumentId,
        "orderDetails": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
        "orderConfirmed": orderConfirmed,
        "orderPreparing ": orderPreparing,
        "orderDelivered": orderDelivered,
        "orderRejected": orderRejected,
        "grandTotalAmount": grandTotalAmount,
        "PaymentTransaction ID": paymentTransactionId,
        "orderID": orderId,
        "timeOfOrder": timeOfOrder,
        "customerData": customerData.toJson(),
    };
}

class CustomerData {
    CustomerData({
        required this.userName,
        required this.userUid,
        required this.name,
        required this.phoneNumber,
        required this.image,
    });

    String userName;
    String userUid;
    String name;
    String phoneNumber;
    String image;

    factory CustomerData.fromJson(Map<String, dynamic> json) => CustomerData(
        userName: json["userName"],
        userUid: json["userUid"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "userName": userName,
        "userUid": userUid,
        "name": name,
        "phoneNumber": phoneNumber,
        "image": image,
    };
}

class OrderDetail {
    OrderDetail({
        required this.image,
        required this.id,
        required this.name,
        required this.price,
        required this.quantity,
        required this.subTotal,
    });

    String image;
    String id;
    String name;
    int price;
    int quantity;
    int subTotal;

    factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        image: json["image"],
        id: json["id"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        subTotal: json["subTotal"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "id": id,
        "name": name,
        "price": price,
        "quantity": quantity,
        "subTotal": subTotal,
    };
}
