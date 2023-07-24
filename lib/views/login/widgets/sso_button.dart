import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class SsoButton extends StatelessWidget {
  final String icon;
  final String label;
  const SsoButton(
    this.icon,
    this.label, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width / 3) + 2,
      child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.White),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  side: BorderSide(color: AppColors.Smoke.withOpacity(0.35))),
            ),
            elevation: MaterialStateProperty.all(0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon, height: 16),
              const SizedBox(
                width: 4,
              ),
              Text(
                label,
                style: TextStyle(
                  color: AppColors.Black.withOpacity(0.8),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                ),
              )
            ],
          )),
    );
  }
}
