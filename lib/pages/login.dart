import 'package:flutter/material.dart';
import 'package:sample/pages/home_page.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  void handleLogin(context) {
    var r = 200;
    if (r == 200) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/logo/dice-2.png', width: 100),
            const SizedBox(height: 50),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(220, 60),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () {
                  handleLogin(context);
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/logo/google.png',
                      width: 30,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'Login with Google',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
