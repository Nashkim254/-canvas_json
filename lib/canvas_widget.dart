import 'dart:convert';
import 'package:canvas/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyCanvasWidget extends StatelessWidget {
  MyCanvasWidget({Key? key}) : super(key: key);
  final controller = Get.put(CanvasController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isCanvasLoaded.value == true
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.teal,
            ),
          )
        : Container(
            height: double.parse(controller.jsonResult['canvasHeight']),
            width: double.parse(controller.jsonResult['canvasWidth']),
            decoration: const BoxDecoration(color: Colors.white),
            child: Stack(children: controller.stackWidgets.value,),
          ));
  }
}
