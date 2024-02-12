
class DoctorModel {
  DoctorModel({
     required this.id,
     this.name,
     this.photo,
     this.photoNationalId,
     this.photoWorkPermit,
     this.photoDoctorsSyndicate,
     this.yearsExp,
     this.doctorSsn,
     this.description,
     this.phoneNumber,
     this.nameDepartment,
     this.age,
     this.gender,
     this.latitude,
     this.longitude,
     this.userId,
     this.servicePrice,

  });

  int id;
  dynamic name;
  dynamic photo;
  dynamic photoNationalId;
  dynamic photoWorkPermit;
  dynamic photoDoctorsSyndicate;
  dynamic yearsExp;
  dynamic doctorSsn;
  dynamic description;
  dynamic phoneNumber;
  dynamic nameDepartment;
  dynamic age;
  dynamic gender;
  dynamic latitude;
  dynamic longitude;
  dynamic userId;
  dynamic servicePrice;

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
    id: json["doctor_id"],
    name: json["DName"],
    photo: json["Photo"],
    photoNationalId: json["Photo_National_ID"],
    photoWorkPermit: json["Photo_Work_Permit"],
    photoDoctorsSyndicate: json["Photo_Doctors_Syndicate"],
    yearsExp: json["Years_Exp"],
    doctorSsn: json["Doctor_Ssn"],
    description: json["Description"],
    phoneNumber: json["Phone_Number"],
    nameDepartment: json["Name_Department"],
    age: json["Age"],
    gender: json["Gender"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    userId: json["User_Id"],
    servicePrice: json["Service_Price"],

  );

  Map<String, dynamic> toJson() => {
    "doctor_id": id,
    "DName": name,
    "Photo": photo,
    "Photo_National_ID": photoNationalId,
    "Photo_Work_Permit": photoWorkPermit,
    "Photo_Doctors_Syndicate": photoDoctorsSyndicate,
    "Years_Exp": yearsExp,
    "Doctor_Ssn": doctorSsn,
    "Description": description,
    "Phone_Number": phoneNumber,
    "Name_Department": nameDepartment,
    "Age": age,
    "Gender": gender,
    "latitude": latitude,
    "longitude": longitude,
    "User_Id": userId,
    "Service_Price": servicePrice,

  };
}
