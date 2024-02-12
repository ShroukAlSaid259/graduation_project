// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class details_dialog extends StatelessWidget {
  var work_days=[];

  details_dialog({
    required this.work_days,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: Text("name",style: const TextStyle(
          color: Colors.blue,
        ),),
        content: Text( ""),
        actions: [
          ElevatedButton(
              onPressed: () {
                if (work_days == null){

                }
                else {

                }

              },
              child: const Text('book')
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