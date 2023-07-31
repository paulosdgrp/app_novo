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
              padding: const EdgeInsets.all(12),
              backgroundColor: AppColors.White,
              elevation: 0,
            ),
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    textDirection: TextDirection.ltr,
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
                      SizedBox(
                        height: 16,
                        child: Text(
                          device.location,
                          style: const TextStyle(
                            color: AppColors.Black,
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            fontFamily: 'Manrope',
                          ),
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Transform.translate(
                    offset: const Offset(10, 0),
                    child: PopupMenuButton(
                      splashRadius: 1,
                      color: AppColors.Tertiary,
                      padding: const EdgeInsets.all(0),
                      offset: const Offset(0, 30),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      itemBuilder: (context) => [],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
