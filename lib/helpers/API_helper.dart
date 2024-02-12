import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/clinic_model.dart';
import '../models/doctors_model.dart';
import '../models/work_days_model.dart';
class API_helper{

 var ipconfig = "http://192.168.1.5:8000";
  getDoctors(id ) async {
    try{

      var url = '$ipconfig/api/DistanceBetweenCoordinate/$id'; // Replace with your phpMyAdmin URL
      var headers = {
        'accept': 'application/json',
        'content-Type': 'application/json'};

      var response = await http.get(Uri.parse(url), headers: headers, );
      if (response.statusCode == 200) {
        List data = json.decode(response.body)['doctors'];
        print(data);
        print(data.map((doctor) => DoctorModel.fromJson(doctor)).toList());
        return data.map((doctor) => DoctorModel.fromJson(doctor)).toList();
      } else {
        print('Errooooooooooooor: ${response.reasonPhrase}');
      }
    }
    catch(e){
      print(e);
    }


  }


  getClinics(id ) async {

    try{
      var url = '$ipconfig/api/DistanceBetweenCoordinate/$id'; // Replace with your phpMyAdmin URL
      var headers = {
        'accept': 'application/json',
        'content-Type': 'application/json'};
      var response = await http.get(Uri.parse(url), headers: headers, );
      if (response.statusCode == 200) {
        List data = json.decode(response.body)['clinics'];
        print(data);
        print(data.map((clinic) => ClinicalModel.fromJson(clinic)).toList());
        return data.map((clinic) => ClinicalModel.fromJson(clinic)).toList();
      } else {
        print('Errooooooooooooor: ${response.reasonPhrase}');
      }
    }
    catch(e){
      print(e);
    }


  }


  SearchForDoctor(String name) async {

    try{
      var url = '$ipconfig/api/doctorAll/$name'; // Replace with your phpMyAdmin URL
      var headers = {
        'accept': 'application/json',
        'content-Type': 'application/json'};
      var response = await http.get(Uri.parse(url), headers: headers, );
      if (response.statusCode == 200) {

        List data = json.decode(response.body);
        print(data);
        return data.map((doctor) => DoctorModel.fromJson(doctor)).toList();
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    }
    catch(e){
      print(e);
    }


  }

  SearchForClinicals(String name) async {

    try{

      var url = '$ipconfig/api/clinics/$name'; // Replace with your phpMyAdmin URL
      var headers = {
        'accept': 'application/json',
        'content-Type': 'application/json'};
      var response = await http.get(Uri.parse(url), headers: headers, );
      if (response.statusCode == 200) {

        List data = json.decode(response.body);
        return data.map((Clinic) => ClinicalModel.fromJson(Clinic)).toList();
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    }
    catch(e){
      print(e);
    }


  }



  getDoctorbyid( id) async {

    try{
      var url = '$ipconfig/api/doctor/$id'; // Replace with your phpMyAdmin URL
      var headers = {
        'accept': 'application/json',
        'content-Type': 'application/json'};
      var response = await http.get(Uri.parse(url), headers: headers, );
      if (response.statusCode == 200) {

        var data = json.decode(response.body);
        print("doctor by id");
        print(data);
        return data.map((doctor) => DoctorModel.fromJson(doctor)).toList();
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    }
    catch(e){
      print(e);
    }
  }

 getClinicbyid( id) async {

   try{
     var url = '$ipconfig/api/clinical/$id'; // Replace with your phpMyAdmin URL
     var headers = {
       'accept': 'application/json',
       'content-Type': 'application/json'};
     var response = await http.get(Uri.parse(url), headers: headers, );
     if (response.statusCode == 200) {

       var data = json.decode(response.body);
       print(data);
       return data.map((clinical) => ClinicalModel.fromJson(clinical)).toList();
     } else {
       print('Error: ${response.reasonPhrase}');
     }
   }
   catch(e){
     print(e);
   }
 }


  Future<void> createReservation(int doctorId, int patientId) async {
    print(doctorId );
    print(patientId );
    final url = Uri.parse('$ipconfig/api/reservationDoctor/$doctorId/$patientId');
    final response = await http.post(url);
    if (response.statusCode == 200) {
      // The request was successful
      print('Reservation created successfully');
    } else {
      // The request failed
      print(response.statusCode) ;
      print('Failed to create reservation');
    }
  }

getClinicalWorkDays(int workday_id) async {

  try{
    var url = '$ipconfig/api/workday/$workday_id'; // Replace with your phpMyAdmin URL
    var headers = {
      'accept': 'application/json',
      'content-Type': 'application/json'};
    var response = await http.get(Uri.parse(url), headers: headers, );
    if (response.statusCode == 200) {

      var data = json.decode(response.body);
      print(data);
      return data.map((workDay) => workDayModel.fromJson(workDay)).toList();
    } else {
      print('Error: ${response.reasonPhrase}');
    }
  }
  catch(e){
    print(e);
  }


}
  reservationClinical(int clinicalId, int patientId,work_day_id) async {

    final url = Uri.parse('$ipconfig/api/reservationClinical/$clinicalId/$patientId/$work_day_id');
    final response = await http.post(url);
    if (response.statusCode == 200) {
      // The request was successful
      print('Reservation created successfully');
    } else {
      // The request failed
      print(response.statusCode) ;
      print('Failed to create reservation');
    }
  }


  final String url = 'http://127.0.0.1:8000/api/reservationDoctor/2/1';
  final String filePath = 'assets/images/surgeon.png';

  Future<void> makeRequest() async {

    final request = http.MultipartRequest('POST', Uri.parse(url));
    final file = await http.MultipartFile.fromPath('file', filePath);
    request.files.add(file);

    final response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
