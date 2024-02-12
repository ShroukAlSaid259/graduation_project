
import 'package:get/get.dart';
import '../views/modules/clinic_details_module/clinic_details_page.dart';
import '../views/modules/doctor_profile_module/doctor_profile_page.dart';
import '../views/modules/doctor_profile_module/profile_binding.dart';
import '../views/modules/home_module/home_bindings.dart';
import '../views/modules/home_module/home_page.dart';
import '../views/modules/search_module/search_bindings.dart';
import '../views/modules/search_module/search_page.dart';
import '../views/modules/view_distance_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static const INITIAL = Routes.HOME;
  static final pages = [

    GetPage(
      name: Routes.HOME,
      page: () => homePage(),
      binding: HomeBinding(),
      transition: Transition.leftToRightWithFade,
      opaque: false,
      showCupertinoParallax: true,
    ),
    GetPage(
      name: Routes.DOCTOR_PROFILE,
      page: () => const doctor_profilePage(),
      transition: Transition.leftToRightWithFade,
      opaque: false,
      binding: DetailsBinding(),
      showCupertinoParallax: true,
    ),
    GetPage(
      name: Routes.clinic_details,
      page: () => const clinicPage(),
      transition: Transition.leftToRightWithFade,
      opaque: false,
      binding: DetailsBinding(),
      showCupertinoParallax: true,
    ),
    GetPage(
      name: Routes.VIEW_DISTANCE,
      page: () => ViewDistance(),
    ),

    GetPage(
      name: Routes.Search_PAGE,
      page: () => searchPage(),
      binding: searchBinding(),
      arguments: Get.arguments,
    ),
  ];
}
