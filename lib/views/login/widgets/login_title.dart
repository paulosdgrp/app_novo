import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Bem vindo!',
      style: TextStyle(
        color: AppColors.Black,
        fontSize: 24,
        fontWeight: FontWeight.w800,
        fontFamily: 'Roboto',
      ),
    );
  }
}
