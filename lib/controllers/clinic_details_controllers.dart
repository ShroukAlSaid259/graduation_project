import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_map/helpers/API_helper.dart';

class ClinicDetailsController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  final RxBool isBottomSheetOpen = false.obs;
  int index = 0;

  List bookAppointment = [];
  bool selected = false;
  var id = Get.arguments;
  late var clinic;

  bool loading = true;
  API_helper api_helper = API_helper();

  List ceckboxseclected = [];

  @override
  void onInit() {
    api_helper.getClinicbyid(id).then((value) {
      clinic = value;
      loading = false;

      print(clinic);
      print("Clinic Details");
      update();
    });
    super.onInit();
  }



  getBookAppointment() {
    api_helper.getClinicalWorkDays(id).then((value) {
      bookAppointment = value;
      for (int i = 0; i < bookAppointment.length; i++) {
        ceckboxseclected.add(false);
      }
      print("Book Appointment");
      update();
    });
  }

  reservationClinical(patiend_id,work_day_id) {
    api_helper.reservationClinical(id,patiend_id,work_day_id).then((value) {
      print("Book Appointment");
      update();
    });
  }
}
