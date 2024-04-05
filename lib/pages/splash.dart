import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:sample/pages/home_page.dart';
import 'package:sample/pages/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Login()),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              createBoxShadow(const Color.fromARGB(255, 245, 187, 12), 10, 5,
                  const Offset(0, 0)),
              createBoxShadow(const Color.fromARGB(255, 255, 193, 5), 15, 5,
                  const Offset(0, 0)),
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: const Icon(Icons.sunny,
              size: 100, color: Color.fromARGB(255, 255, 204, 0)),
        ),
      ),
    );
  }

  BoxShadow createBoxShadow(
      Color color, double blurRadius, double spreadRadius, Offset offset) {
    return BoxShadow(
      color: color,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
      offset: offset,
    );
  }
}
