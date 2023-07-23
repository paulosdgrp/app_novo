import 'dart:async';

import 'package:app/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../constants/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.Background),
                fit: BoxFit.cover,
              ),
            ),
            //fill the screen height
          ),
        ),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
            color: AppColors.PrimaryDark.withOpacity(0.70),
          ),
        )),
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.LogoWhite, height: 68),
            ],
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async => Timer(const Duration(seconds: 3), route);

  route() {
    // Navigator.pushReplacementNamed(context, '/login');
  }
}
