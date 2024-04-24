import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:roblox_master/res/constant/app_images.dart';
import 'package:roblox_master/screen/home/home_screen.dart';

import '../../res/common/media_query.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    Timer(const Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages
                .splashBackGroundImage), // Replace 'splash_image.jpg' with your actual image path
            fit: BoxFit
                .cover, // Use BoxFit.cover for background image to cover the whole screen
          ),
        ),
        child: Center(
          child: AnimatedTextKit(
            isRepeatingAnimation: true,
            animatedTexts: [
              WavyAnimatedText(
                "RobLoxMaster",
                textStyle: TextStyle(
                    fontSize: height(context) / 20,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w600,
                    color: Colors.lime),
              ),
            ],
            onTap: () {
              debugPrint("I am executing");
            },
          ),
        ),
      ),
    );
  }
}
