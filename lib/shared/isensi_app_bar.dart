import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_colors.dart';
import '../constants/app_icons.dart';

class IsensiAppBar extends StatelessWidget implements PreferredSize {
  final double height;
  final String title;
  final String routeName;
  const IsensiAppBar({
    super.key,
    this.title = '',
    this.height = 56.0,
    this.routeName = '',
  });

  @override
  Widget build(BuildContext context) {
    var showLeading = !routeName.isEmpty;
    return AppBar(
      toolbarHeight: height,
      backgroundColor: AppColors.PrimaryDark.withOpacity(0.92),
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
      leading: showLeading
          ? IconButton(
        icon: SvgPicture.asset(
          AppIcons.ArrowLeft,
          fit: BoxFit.cover,
        ),
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
      )
          : null,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size.fromHeight(height);
}