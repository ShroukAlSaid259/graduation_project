// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class details_dialog extends StatelessWidget {
  var name;
  var id;
  var doctorID;
  var Name_Department;

   details_dialog({
     required this.name,
     required this.id,
     this.Name_Department,
     this.doctorID,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: Text(name,style: const TextStyle(
          color: Colors.blue,
        ),),
        content: Text(Name_Department == null ? "": Name_Department),
        actions: [
          ElevatedButton(
              onPressed: () {
                if (doctorID == null){
                  Get.toNamed('/doctor_profile', arguments: id);
                  print(id);
                }
                else {
                  Get.toNamed('/clinic_details', arguments: id);
                }

              },
              child: const Text('View Details')
          ),
          const SizedBox(width: 70,),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}