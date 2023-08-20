import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../constants/app_colors.dart';

FormBuilderTextField IsensiFormBuilderTextField({
  required BuildContext context,
  String? Function(String?)? validator,
  required String name,
  required String hintText,
  bool showSuffixIcon = false,
  bool obscureText = false,
  ValueNotifier<bool>? showPasswordNotifier,
}) {
  final passwordNotifier = showPasswordNotifier ?? ValueNotifier(false);
  return FormBuilderTextField(
    name: name,
    validator: validator,
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: hintText,
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          color: AppColors.Smoke.withOpacity(0.35),
          width: 1,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      hintStyle: const TextStyle(
        color: AppColors.Smoke,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      ),
      suffixIcon: showSuffixIcon
          ? IconButton(
              padding: const EdgeInsets.only(right: 8),
              icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                passwordNotifier.value = !passwordNotifier.value;
              },
            )
          : null,
      suffixIconConstraints: const BoxConstraints(
        maxHeight: 24,
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
