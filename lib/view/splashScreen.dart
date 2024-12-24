import 'package:flutter/material.dart';
import 'package:xhudgayeguru/view/mainScreen.dart';  // Import MainScreen here

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use a Future.delayed in the build method to navigate after 3 seconds.
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to MainScreen after the delay
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your image and text remain unchanged
            Image.network("https://i.imgflip.com/8s7ktm.jpg?a481872"),
            SizedBox(height: 20),
            Text(
              "XHUD GAYE GURU",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
