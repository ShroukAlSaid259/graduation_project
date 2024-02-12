import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../controllers/home_controller.dart';


class ViewDistance extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());
   ViewDistance({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('View Distance'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
            controller.polylineCoordinates.clear();
            controller.polylines.clear();
            controller.dis_markers.removeRange(1,controller.dis_markers.length);
          },

        )
      ),
      body: Stack(children: [
        GetBuilder(
          builder: (HomeController controller) => GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            scrollGesturesEnabled: true,
            circles: controller.circles.toSet(),
            initialCameraPosition: controller.cameraPosition,
            polylines: controller.polylines.values.toSet(),
            markers: controller.dis_markers.toSet(),
            onMapCreated: (GoogleMapController controller) {
              this.controller.googleMapController = controller;
            },
          ),
        ),
      ]),

    );
  }
}
