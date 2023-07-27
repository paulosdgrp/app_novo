import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../group/group.dart';
import '../models/device_group.dart';

class HomeGroupsList extends StatelessWidget {
  const HomeGroupsList({
    super.key,
    required List<DeviceGroup> groups,
  }) : _devices = groups;

  final List<DeviceGroup> _devices;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
      itemCount: _devices.length,
      itemBuilder: (context, index) {
        final device = _devices[index];
        return SizedBox(
          width: double.infinity,
          height: 46,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Group.routeName, arguments: device);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
              backgroundColor: AppColors.White,
              elevation: 0,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      device.name,
                      style: const TextStyle(
                        color: AppColors.Black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: 'Manrope',
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      device.location,
                      style: const TextStyle(
                        color: AppColors.Black,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        fontFamily: 'Manrope',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
