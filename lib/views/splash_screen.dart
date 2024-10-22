import 'dart:async';

import 'package:flutter/material.dart';
import 'package:social_feed_app/utils/image_constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      onTapSplashScreen(context);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                ImageConstant.splashTop,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                ImageConstant.splashBottom,
              ),
            ),
            Center(
              child: Image.asset(
                ImageConstant.splash,
              ),
            ),
            const Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Text(
                'Social Feed App © 2024',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTapSplashScreen(BuildContext context) async {
    Navigator.pushNamed(context, '/login');
  }
}
