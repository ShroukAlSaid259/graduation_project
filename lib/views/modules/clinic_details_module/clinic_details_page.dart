// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/clinic_details_controllers.dart';

class clinicPage extends GetView<ClinicDetailsController> {
  const clinicPage({super.key});

  @override
  Widget build(BuildContext context) {
   int  patientID = 1;
    return Scaffold(
      appBar: AppBar(title: const Text('Clinic details ')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder(
            builder: (ClinicDetailsController controller) =>
            controller.loading != true ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.clinic[0].clinicalName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' ${controller.clinic[0].servicePrice}\$',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  "Department : ${controller.clinic[0].nameDepartment}",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                const Text(
                  'address',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  controller.clinic[0].address,
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
                  controller.clinic[0].phoneNumber.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
                ElevatedButton(onPressed: () {
                  controller.getBookAppointment();
                  controller.isBottomSheetOpen.value = true;
                  Get.bottomSheet(

                    Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child:
                        Form(
                          child: GetBuilder(
                              builder: (ClinicDetailsController controller) =>
                                  Column(
                                      children: [
                                        Text("Select Time",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      ListView.builder(itemBuilder: (context, index) {
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Checkbox(value: controller.ceckboxseclected[index], onChanged: (value) {

                                              for (int i = 0; i < controller.ceckboxseclected.length; i++) {
                                                controller.ceckboxseclected[i] = false;
                                              }
                                              controller.ceckboxseclected[index] = value!;
                                              controller.index = index;
                                              controller.update();
                                            },),
                                            Text("From:"),
                                            SizedBox(width: 10,),
                                            Text(controller.bookAppointment[index].fromTime),
                                            SizedBox(width: 10,),
                                            Text("To:"),
                                            Text(controller.bookAppointment[index].toTime),
                                                              ],
                                        );

                                      },
                                        itemCount: controller.bookAppointment.length,
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                      ),
                                        ElevatedButton(onPressed: () {

                                          if (controller.ceckboxseclected[controller.index] == true) {
                                            controller.reservationClinical(patientID,controller.bookAppointment[controller.index].id);
                                          }
                                          else {
                                            Get.snackbar('Error', 'Please select time');
                                          }
                                        }, child: const Text('Book Now')),

                          ],
                        )
                    ),
                  )),

                  );

                }, child: const Text('Book Now')),
              ],
            ) : Center(child: CircularProgressIndicator())
        ),
      ),
    );
  }
}






