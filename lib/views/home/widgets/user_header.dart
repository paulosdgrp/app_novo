import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      //drawn a circle with border and a image inside
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.White,
            width: 0.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(AppImages.User),
          ),
        ),
      ),
      const SizedBox(width: 16),
      const Text(
        'Oi, ',
        style: TextStyle(
          color: AppColors.White,
          fontWeight: FontWeight.w300,
          fontSize: 20,
          fontFamily: 'Manrope',
        ),
      ),
      const Text(
        'Danielle',
        style: TextStyle(
          color: AppColors.White,
          fontWeight: FontWeight.w500,
          fontSize: 20,
          fontFamily: 'Manrope',
        ),
      ),
    ]);
  }
}
