
import 'dart:convert';

AdressModel adressModelFromJson(String str) =>
    AdressModel.fromJson(json.decode(str));

String adressModelToJson(AdressModel data) => json.encode(data.toJson());

class AdressModel {
  AdressModel({
    required this.name,
    required this.mobile,
    required this.houseName,
    required this.areaNo,
    required this.landMark,
    
  });

  String name;
  String mobile;
  String houseName;
  String areaNo;
  String landMark;


  factory AdressModel.fromJson(Map<String, dynamic> json) => AdressModel(
        name: json["name"],
        mobile: json["mobile"],
        houseName: json["House name"],
        areaNo: json["Area No"],
        landMark: json["land Mark"],
       
        
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "mobile": mobile,
        "House name": houseName,
        "Area No": areaNo,
        "land Mark": landMark,
       
      };
}
