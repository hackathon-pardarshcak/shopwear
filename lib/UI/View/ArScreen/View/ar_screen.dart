import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vector_math/vector_math_64.dart' as vector;

import '../../../../Utils/string_constants.dart';


class ARScreenKit extends StatefulWidget {
  const ARScreenKit({Key? key}) : super(key: key);

  @override
  State<ARScreenKit> createState() => _ARScreenKitState();
}

class _ARScreenKitState extends State<ARScreenKit> {

  ARKitReferenceNode? node;
  ARKitController? arkitController = null;
  Timer? timer;
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF3D3D3D),
            centerTitle: true,
            elevation: 0,
            title: Text('data'),

          ),
          body: ARKitSceneView(
            // enableRotationRecognizer: true,
            planeDetection: ARPlaneDetection.horizontal,
            onARKitViewCreated: onARKitViewCreated,
          )),
    );
  }

  void onARKitViewCreated(ARKitController arkitController) {
    if (this.arkitController != null) {
      this.arkitController?.dispose();
      node = null;
    }
    this.arkitController = arkitController;
    node = ARKitReferenceNode(
      url: humanModel,
      scale: vector.Vector3(0.08380995690822601,
          0.07900360971689224,
          0.08580047637224197),
      position: vector.Vector3(0.0, 0.0, 0.0),
      eulerAngles: vector.Vector3.zero(),
    );
    this.arkitController?.add(node!);
    // timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
    //   final rotation = node?.eulerAngles;
    //   rotation?.x += 0.01;
    //   node?.eulerAngles = rotation!;
    // });
  }
}
