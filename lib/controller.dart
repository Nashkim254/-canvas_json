import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CanvasController extends GetxController {
  var jsonResult = {}.obs;
  var dataList;
  var stackWidgets = <Widget>[].obs;
  var isCanvasLoaded = true.obs;
  @override
  void onInit() {
    getJsonAsset();
    super.onInit();
  }

  Future getJsonAsset() async {
    isCanvasLoaded.value = true;
    String data = await rootBundle.loadString('lib/assets/canvas_json.json');
    jsonResult.value = jsonDecode(data);
    dataList = jsonResult['canvas']['objects'];

    print("<=========${dataList.toList().length}========>");
    for (int i = 0; i < dataList.length; i++) {
      print("<=========entered here========>");
      if (dataList[i]['type'] == "image") {
        print("true===========>");
        stackWidgets.add(Positioned(
          top: double.parse(dataList[i]['top'].toString()),
          left: double.parse(dataList[i]['left'].toString()),
          child: Image.network(
            dataList[i]['src'],
            width: double.parse(dataList[i]['width'].toString()),
            height: double.parse(dataList[i]['height'].toString()),
          ),
        ));
      } else if (dataList[i]['type'] == "i-text") {
        print("false============<");
        stackWidgets.add(Positioned(
          top: double.parse(dataList[i]['top'].toString()),
          left: double.parse(dataList[i]['left'].toString()),
          child: Text(
            dataList[i]['text'],
            style: TextStyle(
              fontSize: double.parse(dataList[i]['fontSize'].toString()),
            ),
          ),
        ));
      }
    }
    isCanvasLoaded.value = false;
  }
}
