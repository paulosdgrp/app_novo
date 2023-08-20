import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icons.dart';
import '../../../shared/isensi_button.dart';

class DeleteDeviceDialog extends StatelessWidget {
  const DeleteDeviceDialog({
    required this.onDelete,
    super.key,
  });

  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 10,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Spacer(),
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: SvgPicture.asset(AppIcons.Close)),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Tem certeza que deseja deletar esse dispositivo?',
                style: TextStyle(
                  color: AppColors.UltramarineBlue,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  fontFamily: 'Manrope',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IsensiButton(
                      'Sim',
                      fontSize: 12,
                      outline: true,
                      fontWeight: FontWeight.w600,
                      borderRadius: 12,
                      width: MediaQuery.of(context).size.width / 3 - 16,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const Spacer(),
                    IsensiButton(
                      'Não',
                      fontSize: 12,
                      backgroundColor: AppColors.UltramarineBlue,
                      fontWeight: FontWeight.w600,
                      borderRadius: 12,
                      width: MediaQuery.of(context).size.width / 3 - 16,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
