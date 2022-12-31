import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vector_math/vector_math_64.dart' as vector;

import '../../../../Config/Services/network_manager.dart';
import '../../../../Utils/error_screen.dart';
import '../../../../Utils/string_constants.dart';


class BottomARScreenKit extends StatefulWidget {
  const BottomARScreenKit({Key? key}) : super(key: key);

  @override
  State<BottomARScreenKit> createState() => _BottomARScreenKitState();
}

class _BottomARScreenKitState extends State<BottomARScreenKit> with WidgetsBindingObserver{

  ARKitReferenceNode? node;
  ARKitController? arkitController = null;
  Timer? timer;
  final GetXNetworkManager networkManager = Get.find<GetXNetworkManager>();
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetXNetworkManager>(
        builder: (builder) => networkManager.connectionType == 0
        ? const SomethingWentWrong()
        :SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF3D3D3D),
            centerTitle: true,
            elevation: 0,
            title: Text('Bottom Wear'),

          ),
          body: ARKitSceneView(
            // enableRotationRecognizer: true,
            planeDetection: ARPlaneDetection.horizontal,
            onARKitViewCreated: onARKitViewCreated,
          )),)
    );
  }

  void onARKitViewCreated(ARKitController arkitController) {
    if (this.arkitController != null) {
      this.arkitController?.dispose();
      node = null;
    }
    this.arkitController = arkitController;
    node = ARKitReferenceNode(
      url: bottomModel,
      scale: vector.Vector3(0.08380995690822601,
          0.07900360971689224,
          0.08580047637224197),
      position: vector.Vector3(0.0, -0.9, -0.9),
      eulerAngles: vector.Vector3.zero(),
    );
    this.arkitController?.add(node!);
    timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      final rotation = node?.eulerAngles;
      rotation?.x += 0.01;
      node?.eulerAngles = rotation!;
    });
  }
}
