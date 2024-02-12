import 'package:get/get.dart';
import 'package:project_map/controllers/datails_controller.dart';

import '../../../controllers/search_controller.dart';


class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsController());
  }
}