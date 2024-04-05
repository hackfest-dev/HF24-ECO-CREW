import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sample/components/search_appbar.dart';
import 'package:sample/components/camera_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();
    initCameras();
  }

  Future<void> initCameras() async {
    cameras = await availableCameras();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Search_Bar(), // Use the SearchBar widget here
      ),
      body: const Center(
        child: Text("Welcome to the Page!"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.camera_alt_outlined),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CameraWidget(cameras)),
          );
        },
      ),
    );
  }
}
