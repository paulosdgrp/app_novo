import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icons.dart';
import '../group.dart';
import 'delete_device_dialog.dart';

class Gateway extends StatelessWidget {
  final String gatewayName;
  final String icon;

  const Gateway({
    required this.gatewayName,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.White),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset(
              icon,
              height: 22,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              gatewayName,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Manrope',
                  color: AppColors.Black),
            ),
            const Spacer(),
            Transform.translate(
              offset: const Offset(15, 0),
              child: PopupMenuButton(
                splashRadius: 1,
                constraints: const BoxConstraints(
                  minWidth: 0,
                  maxWidth: 96,
                ),
                color: AppColors.Tertiary,
                padding: const EdgeInsets.all(0),
                offset: const Offset(0, 30),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    height: 20,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.Edit,
                          height: 12,
                          color: AppColors.White,
                          fit: BoxFit.scaleDown,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Editar',
                          style: TextStyle(
                            color: AppColors.White,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Manrope',
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    height: 24,
                    onTap: () {
                      Future.delayed(const Duration(milliseconds: 0), () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => DeleteDeviceDialog(
                            onDelete: () {},
                          ),
                        );
                      });
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.Trash,
                          height: 12,
                          color: AppColors.White,
                          fit: BoxFit.scaleDown,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Excluir',
                          style: TextStyle(
                            color: AppColors.White,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Manrope',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
