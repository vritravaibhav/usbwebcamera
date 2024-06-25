import 'package:flutter/material.dart';

import 'package:flutter_uvc_camera/flutter_uvc_camera.dart';

class Screen7 extends StatefulWidget {
  const Screen7({super.key});

  @override
  State<Screen7> createState() => _Screen7State();
}

class _Screen7State extends State<Screen7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('uvc')),
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CameraTest()));
            },
            child: const Text('camera test')),
      ),
    );
  }
}

class CameraTest extends StatefulWidget {
  const CameraTest({super.key});

  @override
  State<CameraTest> createState() => _CameraTestState();
}

class _CameraTestState extends State<CameraTest> {
  UVCCameraController? cameraController;

  @override
  void initState() {
    super.initState();
    cameraController = UVCCameraController();
    cameraController?.msgCallback = (state) {
      // showCustomToast(state);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(state)));
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('UVC Camera Example'),
        ),
        body: Column(
          children: [
            Center(
              child: UVCCameraView(
                  cameraController: cameraController!, width: 300, height: 300),
            ),
          ],
        ),
      ),
    );
  }
}
