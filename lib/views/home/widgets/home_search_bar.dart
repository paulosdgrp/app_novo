import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icons.dart';

class HomeSearchBar extends StatelessWidget {
  final Function(String)? onChanged;
  const HomeSearchBar({
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 32,
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Pesquisar...',
          hintStyle: const TextStyle(
            color: AppColors.White,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            fontFamily: 'Manrope',
          ),
          prefixIcon: SvgPicture.asset(
            AppIcons.Search,
            width: 12,
            height: 12,
            fit: BoxFit.scaleDown,
          ),
          filled: true,
          fillColor: AppColors.White.withOpacity(0.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 8,
          ),
        ),
        style: const TextStyle(
          color: AppColors.White,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          fontFamily: 'Manrope',
        ),
      ),
    );
  }
}
