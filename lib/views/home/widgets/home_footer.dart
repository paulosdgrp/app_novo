import 'package:app/shared/isensi_create_button.dart';
import 'package:flutter/material.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({
    required this.createDevice,
    required this.createGroup,
    super.key,
  });

  final void Function() createDevice;
  final void Function() createGroup;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IsensiCreateButton(
          'Dispositivo',
          onPressed: createDevice,
        ),
        const Spacer(),
        IsensiCreateButton(
          'Grupo',
          onPressed: createGroup,
        )
      ],
    );
  }
}
