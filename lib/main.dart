import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_map/routes/app_pages.dart';
import 'package:project_map/views/modules/home_module/home_bindings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialBinding: HomeBinding(),
      initialRoute: AppPages.INITIAL ,  //AppPages.INITIAL
    );
  }
}

