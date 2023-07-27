import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class IsensiButton extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  final double? fontSize;
  final Color? textColor;
  final Color? backgroundColor;
  final double? borderRadius;
  final FontWeight? fontWeight;
  final bool outline;
  const IsensiButton(this.label,
      {super.key,
      required this.onPressed,
      this.fontSize,
      this.textColor,
      this.backgroundColor,
      this.borderRadius,
      this.fontWeight,
      this.outline = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(outline
                  ? AppColors.White
                  : (backgroundColor ?? AppColors.Primary)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
                ),
              ),
              elevation: MaterialStateProperty.all(0),
              side: MaterialStateProperty.all(BorderSide(
                  color: outline
                      ? AppColors.UltramarineBlue
                      : Colors.transparent)),
            ),
            onPressed: onPressed,
            child: Text(label,
                style: TextStyle(
                  color: outline
                      ? AppColors.UltramarineBlue
                      : (textColor ?? AppColors.White),
                  fontSize: fontSize ?? 14,
                  fontWeight: fontWeight ?? FontWeight.w400,
                  fontFamily: 'Roboto',
                ))),
      ),
    );
  }
}
