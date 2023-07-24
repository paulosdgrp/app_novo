import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField(
    this.label, {
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: label,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: AppColors.Smoke.withOpacity(0.35),
            width: 1,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        labelStyle: const TextStyle(
          color: AppColors.Smoke,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }
}
