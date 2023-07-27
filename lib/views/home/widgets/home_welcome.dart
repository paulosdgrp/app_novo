import 'package:app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class HomeWelcome extends StatelessWidget {
  const HomeWelcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(48.0),
      child: Column(
        children: [
          Text(
            'Bem vindo!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.White,
              fontWeight: FontWeight.w800,
              fontSize: 16,
              fontFamily: 'Manrope',
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Para iniciar a configuração primeiro crie um grupo.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.White,
              fontWeight: FontWeight.w800,
              fontSize: 16,
              fontFamily: 'Manrope',
            ),
          ),
        ],
      ),
    );
  }
}
