// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/datails_controller.dart';

class doctor_profilePage extends GetView<DetailsController> {
  const doctor_profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Doctor profile ')),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder(
            builder: (DetailsController controller) => controller.loading != true ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  controller.doctor[0].name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),

                Text(
                  controller.doctor[0].nameDepartment,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                const Text(
                  'description',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  controller.doctor[0].description,
                  style: const TextStyle(
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Phone',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  controller.doctor[0].phoneNumber.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
                ElevatedButton(onPressed: () {
                  controller.bookAppointment(1);
                }, child: const Text('Book Now')),
              ],
            ) :  Center(child: CircularProgressIndicator())
          )),
    );
  }
}
