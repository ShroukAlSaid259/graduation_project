
import 'package:get/get.dart';
import 'package:project_map/helpers/API_helper.dart';

class DetailsController extends GetxController {
  var id = Get.arguments;
   late  var doctor ;
 bool loading = true;
  API_helper api_helper = API_helper();

  @override
  void onInit() {
    api_helper.getDoctorbyid(id).then((value) {
      doctor = value;
      print("Vaaaaaaaaaaaale");
      print(value);
      loading = false;
      print("doctordetiiiiiiiiiiiiiiiiiiis");
      print(doctor);
      update();
    });
    super.onInit();
  }

  bookAppointment(patientId) async {
    api_helper.createReservation(id,patientId).then((value) {
    });
  }

}