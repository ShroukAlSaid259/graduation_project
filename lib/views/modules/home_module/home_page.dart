// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../controllers/home_controller.dart';


class homePage extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());

   homePage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        GetBuilder(
          builder: (HomeController controller) => GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            circles: controller.circles.toSet(),
            initialCameraPosition: controller.cameraPosition,
            markers: controller.markers.toSet(),
            onMapCreated: (GoogleMapController controller) {
              this.controller.googleMapController = controller;
            },
          ),
        ),
        Container(
          margin:const EdgeInsets.only(top: 50,left: 20,right: 20 ),
          padding:const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Search",
              suffixIcon: Icon(Icons.search),
            ),
           onTap: () {
              Get.toNamed('/search_page');
            },
        ),
        ),
      ]),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(right:40),
        child: FloatingActionButton(
          onPressed: () async {
            controller.getMyCurrentLocation();
            controller.onInit();
          },
          child: const Icon(Icons.place),
        ),
      ),
    );
  }
}
