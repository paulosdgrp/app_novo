import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_colors.dart';
import '../constants/app_icons.dart';

class IsensiCreateButton extends StatelessWidget {
  const IsensiCreateButton(
    this.label, {
    required this.onPressed,
    super.key,
  });

  final String label;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 36 - 8,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            backgroundColor: AppColors.White.withOpacity(0.1),
            elevation: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.White,
                fontWeight: FontWeight.w400,
                fontSize: 15,
                fontFamily: 'Roboto',
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              AppIcons.Add,
              width: 12,
              height: 12,
              fit: BoxFit.scaleDown,
            ),
          ],
        ),
      ),
    );
  }
}
