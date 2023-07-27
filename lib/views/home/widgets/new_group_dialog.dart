import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icons.dart';
import '../../../shared/isensi_button.dart';
import '../../../shared/isensi_text_form_field_group.dart';

class NewGroupDialog extends StatefulWidget {
  const NewGroupDialog(this.createDevice, {super.key});

  final void Function(String name, String location) createDevice;

  @override
  State<NewGroupDialog> createState() => _NewGroupDialogState();
}

class _NewGroupDialogState extends State<NewGroupDialog> {
  String _location = '';
  String _name = '';

  void _setName(String name) {
    setState(() {
      _name = name;
    });
  }

  void _setLocation(String location) {
    setState(() {
      _location = location;
    });
  }

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
          width: MediaQuery.of(context).size.width - 48 * 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Transform.translate(
                    offset: const Offset(12, 0),
                    child: const Text(
                      'Novo Grupo',
                      style: TextStyle(
                        color: AppColors.Primary,
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: SvgPicture.asset(AppIcons.Close))
                ],
              ),
              IsensiTextFormFieldGroup(
                label: 'Nome',
                hint: 'nome do grupo',
                onChanged: _setName,
              ),
              const SizedBox(height: 10),
              IsensiTextFormFieldGroup(
                label: 'Local',
                hint: 'local do grupo',
                onChanged: _setLocation,
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 160,
                height: 24,
                child: IsensiButton(
                  'Adicionar',
                  fontSize: 12,
                  backgroundColor: AppColors.UltramarineBlue,
                  fontWeight: FontWeight.w600,
                  borderRadius: 10,
                  onPressed: () {
                    widget.createDevice(_name, _location);
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
