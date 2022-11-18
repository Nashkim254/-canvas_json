import 'dart:convert';

import 'package:canvas/canvas_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyCanvas());
}

class MyCanvas extends StatelessWidget {
  const MyCanvas({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Canvas"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: MyCanvasWidget(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
