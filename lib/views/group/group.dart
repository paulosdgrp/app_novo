import 'package:app/constants/app_icons.dart';
import 'package:app/shared/isensi_create_button.dart';
import 'package:app/views/group/widgets/gateway.dart';
import 'package:app/views/home/home.dart';
import 'package:app/models/device_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';
import '../../shared/isensi_app_bar.dart';
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





