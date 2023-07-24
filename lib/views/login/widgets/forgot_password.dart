import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Text('Esqueceu a senha?',
          style: TextStyle(
            color: AppColors.Primary,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto',
          ))
    ]);
  }
}
