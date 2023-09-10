import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/widgets/onBoarding.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Loading() async {
    Timer(Duration(seconds: 3), () {
      Get.offAll(OnBoarding());
    });
  }

  @override
  void initState() {
    Loading();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}