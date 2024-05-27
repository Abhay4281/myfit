import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dashboard.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    // Hide the status bar for a cleaner splash screen experience
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    _controller = VideoPlayerController.asset('assets/splashscreen.mp4')
      ..initialize().then((_) {

        setState(() {});

        _controller.play();
      });

    _navigateToHome();
  }
  @override
  void dispose() {
    // Dispose the video player controller to free resources
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Or your preferred background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_controller.value.isInitialized)
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            SizedBox(height: 20),
            Text(
              "Welcome to MyFitness 21!",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Navigate to the home screen after a delay
  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3)); // Change duration as needed
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Dashboard()), // Replace with your home screen widget
    );
  }
}
