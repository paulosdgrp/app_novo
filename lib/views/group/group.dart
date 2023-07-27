import 'package:app/constants/app_icons.dart';
import 'package:app/views/home/home.dart';
import 'package:app/views/home/models/device_group.dart';
import 'package:app/shared/isensi_create_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';
import '../../shared/isensi_button.dart';
import '../home/widgets/new_group_dialog.dart';

class Group extends StatelessWidget {
  const Group({super.key});

  static const routeName = '/group';

  @override
  Widget build(BuildContext context) {
    final group =
        (ModalRoute.of(context)!.settings.arguments as DeviceGroup?) ??
            DeviceGroup(name: 'Grupo 1', location: 'Montagem');
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: AppColors.BackgroundGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(AppIcons.ArrowLeft),
                    onPressed: () {
                      Navigator.pushNamed(context, Home.routeName);
                    },
                  ),
                  const Spacer(),
                  Text(
                    '${group.name} - ${group.location}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer()
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              IsensiCreateButton('Novo Gateway', onPressed: () {}),
              const SizedBox(
                height: 48,
              ),
              Column(
                children: [
                  Gateway(
                    gatewayName: 'Gateway 1',
                    icon: AppIcons.Failed,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Gateway(
                    gatewayName: 'Gateway 2',
                    icon: AppIcons.Pending,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Gateway(
                    gatewayName: 'Gateway 3',
                    icon: AppIcons.Done,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Editar',
                          style: TextStyle(
                            color: AppColors.White,
                            fontSize: 10,
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
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Excluir',
                          style: TextStyle(
                            color: AppColors.White,
                            fontSize: 10,
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
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: SvgPicture.asset(AppIcons.Close))
                ],
              ),
              Container(
                width: double.infinity,
                color: AppColors.Tertiary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 20,
                      child: IsensiButton(
                        'Sim',
                        fontSize: 12,
                        outline: true,
                        fontWeight: FontWeight.w600,
                        borderRadius: 12,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 20,
                      child: IsensiButton(
                        'Não',
                        fontSize: 12,
                        backgroundColor: AppColors.UltramarineBlue,
                        fontWeight: FontWeight.w600,
                        borderRadius: 12,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
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
