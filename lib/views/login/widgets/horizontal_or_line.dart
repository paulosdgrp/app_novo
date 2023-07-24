import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class HorizontalOrLine extends StatelessWidget {
  const HorizontalOrLine({
    super.key,
    required this.label,
    required this.height,
  });

  final double height;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: Divider(
              color: AppColors.Smoke.withOpacity(0.75),
              height: height,
            )),
      ),
      Text(
        label,
        style: TextStyle(
          color: AppColors.Black.withOpacity(0.6),
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto',
        ),
      ),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: Divider(
              color: AppColors.Smoke.withOpacity(0.75),
              height: height,
            )),
      ),
    ]);
  }
}
