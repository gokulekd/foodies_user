// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:foodies_user/model/add_to_cart.dart';
import 'package:foodies_user/model/user_model.dart';

class OderTrackingDetails {
      String firebaseDocumentId;
      List<AddtoCart> cartData; 
    bool orderConfirmed;
    bool orderPreparing;
    bool orderDelivered;
    bool orderRejected;
    double grandTotalAmount;
    String paymentTransactionId;
    String orderId;
    DateTime timeOfOrder;
    UserModel user;
  OderTrackingDetails({
    required this.firebaseDocumentId,
    required this.cartData,
    required this.orderConfirmed,
    required this.orderPreparing,
    required this.orderDelivered,
    required this.orderRejected,
    required this.grandTotalAmount,
    required this.paymentTransactionId,
    required this.orderId,
    required this.timeOfOrder,
    required this.user,
  });

  OderTrackingDetails copyWith({
    String? firebaseDocumentId,
    List<AddtoCart>? cartData,
    bool? orderConfirmed,
    bool? orderPreparing,
    bool? orderDelivered,
    bool? orderRejected,
    int? grandTotalAmount,
    String? paymentTransactionId,
    String? orderId,
    DateTime? timeOfOrder,
    UserModel? user,
  }) {
    return OderTrackingDetails(
      firebaseDocumentId: firebaseDocumentId ?? this.firebaseDocumentId,
      cartData: cartData ?? this.cartData,
      orderConfirmed: orderConfirmed ?? this.orderConfirmed,
      orderPreparing: orderPreparing ?? this.orderPreparing,
      orderDelivered: orderDelivered ?? this.orderDelivered,
      orderRejected: orderRejected ?? this.orderRejected,
      grandTotalAmount: grandTotalAmount!.toDouble(),
      paymentTransactionId: paymentTransactionId ?? this.paymentTransactionId,
      orderId: orderId ?? this.orderId,
      timeOfOrder: timeOfOrder ?? this.timeOfOrder,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firebaseDocumentId': firebaseDocumentId,
      'cartData': cartData.map((x) => x.toMap()).toList(),
      'orderConfirmed': orderConfirmed,
      'orderPreparing': orderPreparing,
      'orderDelivered': orderDelivered,
      'orderRejected': orderRejected,
      'grandTotalAmount': grandTotalAmount,
      'paymentTransactionId': paymentTransactionId,
      'orderId': orderId,
      'timeOfOrder': timeOfOrder.millisecondsSinceEpoch,
      'user': user.toMap(),
    };
  }

  factory OderTrackingDetails.fromMap(Map<String, dynamic> map) {
    return OderTrackingDetails(
      firebaseDocumentId: map['firebaseDocumentId'] as String,
      cartData: List<AddtoCart>.from((map['cartData'] as List).map<AddtoCart>((x) => AddtoCart.fromMap(x as Map<String,dynamic>),),),
      orderConfirmed: map['orderConfirmed'] as bool,
      orderPreparing: map['orderPreparing'] as bool,
      orderDelivered: map['orderDelivered'] as bool,
      orderRejected: map['orderRejected'] as bool,
      grandTotalAmount: map['grandTotalAmount'] as double,
      paymentTransactionId: map['paymentTransactionId'] as String,
      orderId: map['orderId'] as String,
      timeOfOrder: DateTime.fromMillisecondsSinceEpoch(map['timeOfOrder'] as int),
      user: UserModel.fromMap(map['user'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory OderTrackingDetails.fromJson(String source) => OderTrackingDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OderTrackingDetails(firebaseDocumentId: $firebaseDocumentId, cartData: $cartData, orderConfirmed: $orderConfirmed, orderPreparing: $orderPreparing, orderDelivered: $orderDelivered, orderRejected: $orderRejected, grandTotalAmount: $grandTotalAmount, paymentTransactionId: $paymentTransactionId, orderId: $orderId, timeOfOrder: $timeOfOrder, user: $user)';
  }

  @override
  bool operator ==(covariant OderTrackingDetails other) {
    if (identical(this, other)) return true;
  
    return 
      other.firebaseDocumentId == firebaseDocumentId &&
      listEquals(other.cartData, cartData) &&
      other.orderConfirmed == orderConfirmed &&
      other.orderPreparing == orderPreparing &&
      other.orderDelivered == orderDelivered &&
      other.orderRejected == orderRejected &&
      other.grandTotalAmount == grandTotalAmount &&
      other.paymentTransactionId == paymentTransactionId &&
      other.orderId == orderId &&
      other.timeOfOrder == timeOfOrder &&
      other.user == user;
  }

  @override
  int get hashCode {
    return firebaseDocumentId.hashCode ^
      cartData.hashCode ^
      orderConfirmed.hashCode ^
      orderPreparing.hashCode ^
      orderDelivered.hashCode ^
      orderRejected.hashCode ^
      grandTotalAmount.hashCode ^
      paymentTransactionId.hashCode ^
      orderId.hashCode ^
      timeOfOrder.hashCode ^
      user.hashCode;
  }
}
