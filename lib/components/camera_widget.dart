import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sample/pages/display_picture.dart';

class CameraWidget extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraWidget(this.cameras, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget>
    with WidgetsBindingObserver {
  CameraController? controller;
  bool _isCameraInitialized = false;

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller!.dispose();
    }
    controller = CameraController(
      cameraDescription,
      ResolutionPreset.low,
    );

    controller!.addListener(() {
      if (mounted) {
        setState(() {
          _isCameraInitialized = controller!.value.isInitialized;
        });
      }
    });

    try {
      await controller!.initialize();
      // ignore: empty_catches
    } on CameraException {}

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
    onNewCameraSelected(widget.cameras[0]);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      // Free up memory when camera not active
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // Reinitialize the camera with same properties
      onNewCameraSelected(cameraController.description);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: _isCameraInitialized
                ? AspectRatio(
                    aspectRatio: (controller!.value.aspectRatio),
                    child: controller!.buildPreview(),
                  )
                : Container(color: Colors.black),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.black,
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.camera, size: 60),
                  color: Colors.white,
                  onPressed: () {
                    _takePicture(context);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _takePicture(context) async {
    if (!controller!.value.isInitialized) {
      return;
    }
    final XFile file = await controller!.takePicture();
    if (file.path.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DisplayPictureScreen(image: file, imagePath: file.path)));
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
