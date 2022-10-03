// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {

  String? email;
  String uid;
  String? name;
  String? phoneNumber;
  String? image;
  UserModel({
    this.email,
    required this.uid,
    this.name,
    this.phoneNumber,
    this.image,
  });


  UserModel copyWith({
    String? email,
    String? uid,
    String? name,
    String? phoneNumber,
    String? image,
  }) {
    return UserModel(
      email: email ?? this.email,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'uid': uid,
      'name': name,
      'phoneNumber': phoneNumber,
      'image': image,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] != null ? map['email'] as String : null,
      uid: map['uid'] as String,
      name: map['name'] != null ? map['name'] as String : null,
      phoneNumber: map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(email: $email, uid: $uid, name: $name, phoneNumber: $phoneNumber, image: $image)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.uid == uid &&
      other.name == name &&
      other.phoneNumber == phoneNumber &&
      other.image == image;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      uid.hashCode ^
      name.hashCode ^
      phoneNumber.hashCode ^
      image.hashCode;
  }
}
