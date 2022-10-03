
import 'dart:convert';

SelectedDeliveryAdress selectedDeliveryAdressFromJson(String str) => SelectedDeliveryAdress.fromJson(json.decode(str));

String selectedDeliveryAdressToJson(SelectedDeliveryAdress data) => json.encode(data.toJson());

class SelectedDeliveryAdress {
    SelectedDeliveryAdress({

        required this.documentId,
        required this.areaNo,
        required this.houseName,
        required this.landMark,
        required this.mobile,
        required this.name,
    });

    String? documentId;
    String? areaNo;
    String? houseName;
    String? landMark;
    String? mobile;
    String? name;
    

    factory SelectedDeliveryAdress.fromJson(Map<String, dynamic>? json) => SelectedDeliveryAdress(
        documentId: json?["Document Id"]??"",

        areaNo: json?["areaNo"]??"",
        houseName: json?["houseName"]??"",
        landMark: json?["landMark"]??"",
        mobile: json?["mobile"]??"",
        name: json?["name"]??"",
    );

    Map<String, dynamic>? toJson() => {
        "Document Id": documentId!,
        "areaNo": areaNo!,
        "houseName": houseName!,
        "landMark": landMark!,
        "mobile": mobile!,
        "name": name!,
    };
}
