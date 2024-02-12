
import 'dart:convert';

List<ClinicalModel> clinicalFromJson(String str) => List<ClinicalModel>.from(json.decode(str).map((x) => ClinicalModel.fromJson(x)));

String clinicalToJson(List<ClinicalModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClinicalModel {
  ClinicalModel({
    required this.id,
     this.clinicalName,
     this.photo,
     this.photoWorkPermit,
     this.nameDepartment,
     this.address,
    this.latitude,
    this.longitude,
     this.details,
     this.phoneNumber,
     this.servicePrice,
    required this.doctorId,

  });

  dynamic id;
  dynamic clinicalName;
  dynamic photo;
  dynamic photoWorkPermit;
  dynamic nameDepartment;
  dynamic address;
  dynamic latitude;
  dynamic longitude;
  dynamic details;
  dynamic phoneNumber;
  dynamic servicePrice;
  dynamic doctorId;


  factory ClinicalModel.fromJson(Map<String, dynamic> json) => ClinicalModel(
    id: json["id"],
    clinicalName: json["Clinical_Name"],
    photo: json["Photo"],
    photoWorkPermit: json["Photo_Work_Permit"],
    nameDepartment: json["Name_Department"],
    address: json["Address"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    details: json["Details"],
    phoneNumber: json["Phone_Number"],
    servicePrice: json["Service_Price"],
    doctorId: json["Doctor_Id"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Clinical_Name": clinicalName,
    "Photo": photo,
    "Photo_Work_Permit": photoWorkPermit,
    "Name_Department": nameDepartment,
    "Address": address,
    "Latitude": latitude,
    "Longitude": longitude,
    "Details": details,
    "Phone_Number": phoneNumber,
    "Service_Price": servicePrice,
    "Doctor_Id": doctorId,

  };
}
