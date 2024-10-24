// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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

  Future<void> onTapSplashScreen(BuildContext context) async {
    // Open the Hive box to check login status
    var loginBox = await Hive.openBox('loginBox');

    // Check if the user is logged in
    bool isLoggedIn = loginBox.get('isLoggedIn', defaultValue: false);

    // Navigate to the correct screen based on the login status
    if (isLoggedIn) {
      // Navigate to the home screen if the user is logged in
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Navigate to the login screen if the user is not logged in
      Navigator.pushReplacementNamed(context, '/login');
    }
  }
}
