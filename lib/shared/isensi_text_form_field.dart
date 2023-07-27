import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class IsensiTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final String label;
  final void Function(String)? onChanged;

  const IsensiTextFormField(
    this.label, {
    super.key,
    this.onChanged,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: label,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: AppColors.Smoke.withOpacity(0.35),
            width: 1,
          ),
        ),
        contentPadding: padding,
        hintStyle: const TextStyle(
          color: AppColors.Smoke,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto',
        ),
      ),
      style: const TextStyle(
        color: AppColors.Grey,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      ),
    );
  }
}
