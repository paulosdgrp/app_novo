import 'package:app/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'isensi_text_form_field.dart';

class IsensiTextFormFieldGroup extends StatelessWidget {
  const IsensiTextFormFieldGroup({
    required this.label,
    required this.hint,
    this.onChanged,
    super.key,
  });

  final Function(String)? onChanged;
  final String hint;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.Grey,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            fontFamily: 'Manrope',
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        IsensiTextFormField(
          hint,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
