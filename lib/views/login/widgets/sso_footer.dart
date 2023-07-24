import 'package:app/views/login/widgets/sso_button.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_icons.dart';

class SsoFooter extends StatelessWidget {
  const SsoFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SsoButton(AppIcons.Google, 'Google'),
        SsoButton(AppIcons.Facebook, 'Facebook')
      ],
    );
  }
}
