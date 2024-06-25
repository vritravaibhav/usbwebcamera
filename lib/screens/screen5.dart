import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<StatefulWidget> createState() => new CameraState();
}

class CameraState extends State<Camera> {
  List<CameraDescription>? cameras;
  CameraController? controller;
  bool isReady = false;
  bool noCameraDevice = false;
  int selectedCamera = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _setupCamera();
  }

  Future<void> _setupCamera() async {
    try {
      // initialize cameras.
      cameras = await availableCameras();
      // initialize camera controllers.
      controller =
          CameraController(cameras![selectedCamera], ResolutionPreset.medium);
      cameras!.forEach((element) {
        print("$element avada kedavda");
      });

      await controller?.initialize();
    } on CameraException catch (_) {
      debugPrint("Some error occured!");
    }

    if (!mounted) {
      return;
    }

    setState(() {
      isReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return new Container();
    }
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          for (int i = 0; i < cameras!.length; i++)
            Text(cameras![i].toString()),
          ElevatedButton(
              onPressed: () {
                selectedCamera = 0;
                _setupCamera();
                setState(() {});
              },
              child: Text("0")),
          ElevatedButton(
              onPressed: () {
                selectedCamera = 1;
                _setupCamera();
                setState(() {});
              },
              child: Text("0")),
          ElevatedButton(
              onPressed: () {
                selectedCamera = 2;
                _setupCamera();
                setState(() {});
              },
              child: Text("0")),
          ElevatedButton(
            onPressed: () {},
            child: Text("Creating Data"),
          ),
          ElevatedButton(
              onPressed: () {
                selectedCamera = 3;
                _setupCamera();
                setState(() {});
              },
              child: Text("0")),
          new AspectRatio(
              aspectRatio: controller!.value.aspectRatio,
              child: new CameraPreview(controller!)),
        ],
      ),
    );
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void showInSnackBar(String message) {
    // _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  void logError(String code, String message) =>
      print('Error: $code\nError Message: $message');

  void toggleCamera() {
    setState(() {
      selectedCamera = (selectedCamera == 1) ? 0 : 1;
      _setupCamera();
    });
  }

  // Future<String> takePicture() async {
  //   if (!controller!.value.isInitialized) {
  //     showInSnackBar('Error: select a camera first.');
  //     return "";
  //   }
  //   // final Directory extDir = await getApplicationDocumentsDirectory();
  //   // final String dirPath = '${extDir.path}/Pictures/trekker_trek';
  //   // await Directory(dirPath).create(recursive: true);
  //   // final String filePath = '$dirPath/${timestamp()}.jpg';

  //   if (controller!.value.isTakingPicture) {
  //     // A capture is already pending, do nothing.
  //     return "";
  //   }

  //   try {
  //     await controller!.takePicture();
  //   } on CameraException catch (e) {
  //     _showCameraException(e);
  //     return "";
  //   }
  //   return filePath;
  // }

  void _showCameraException(CameraException e) {
    logError(e.code, e.description!);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }
}
