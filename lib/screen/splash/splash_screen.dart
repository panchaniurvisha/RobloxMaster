import 'dart:async';

import 'package:flutter/material.dart';
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
          color: Colors.teal,
        ),
        child: Center(
          child: Text(
            "RobLoxMaster",
            style: TextStyle(
                fontSize: height(context) / 20,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(0.5)),
          ),
        ),
      ),
    );
  }
}
