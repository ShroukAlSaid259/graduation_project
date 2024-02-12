
import 'dart:convert';

DistanceBetweenCoordinateModel distanceBetweenCoordinateModelFromJson(String str) => DistanceBetweenCoordinateModel.fromJson(json.decode(str));
String distanceBetweenCoordinateModelToJson(DistanceBetweenCoordinateModel data) => json.encode(data.toJson());

class DistanceBetweenCoordinateModel {
  DistanceBetweenCoordinateModel({
    required this.doctors,
    required this.clinics,
  });

  final List<Clinic> doctors;
  final List<Clinic> clinics;

  factory DistanceBetweenCoordinateModel.fromJson(Map<String, dynamic> json) => DistanceBetweenCoordinateModel(
    doctors: List<Clinic>.from(json["doctors"].map((x) => Clinic.fromJson(x))),
    clinics: List<Clinic>.from(json["clinics"].map((x) => Clinic.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "doctors": List<dynamic>.from(doctors.map((x) => x.toJson())),
    "clinics": List<dynamic>.from(clinics.map((x) => x.toJson())),
  };
}

class Clinic {
  Clinic({
    required this.clinicalName,
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.distance,
    required this.dName,
  });

  final String clinicalName;
  final int id;
  final dynamic latitude;
  final dynamic longitude;
  final dynamic distance;
  final String dName;

  factory Clinic.fromJson(Map<String, dynamic> json) => Clinic(
    clinicalName: json["Clinical_Name"],
    id: json["id"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    distance: json["distance"],
    dName: json["DName"],
  );

  Map<String, dynamic> toJson() => {
    "Clinical_Name": clinicalName,
    "id": id,
    "latitude": latitude,
    "longitude": longitude,
    "distance": distance,
    "DName": dName,
  };
}
