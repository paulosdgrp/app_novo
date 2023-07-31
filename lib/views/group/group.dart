import 'package:app/constants/app_icons.dart';
import 'package:app/shared/isensi_create_button.dart';
import 'package:app/views/home/home.dart';
import 'package:app/views/home/models/device_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';
import '../../shared/isensi_button.dart';
import '../new_gateway/new_gateway.dart';

class Group extends StatelessWidget {
  const Group({super.key});

  static const routeName = '/group';

  @override
  Widget build(BuildContext context) {
    final group =
        (ModalRoute.of(context)!.settings.arguments as DeviceGroup?) ??
            DeviceGroup(name: 'Grupo 1', location: 'Montagem');
    return Scaffold(
      appBar: IsensiAppBar(
        title: '${group.name} - ${group.location}',
        routeName: Home.routeName,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: AppColors.BackgroundGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 36.0,
            vertical: 48,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IsensiCreateButton(
                'Novo Gateway',
                onPressed: () {
                  Navigator.pushNamed(context, NewGateway.routeName);
                },
              ),
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
