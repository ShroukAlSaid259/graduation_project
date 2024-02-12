import 'package:get/get.dart';
import 'package:project_map/controllers/datails_controller.dart';

import '../../../controllers/clinic_details_controllers.dart';
import '../../../controllers/search_controller.dart';


class ClinicDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClinicDetailsController());
  }
}