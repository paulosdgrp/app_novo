import 'package:app/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_icons.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: AppColors.BackgroundGradient,
        ),
        child: Padding(
          padding: EdgeInsets.all(36.0),
          child: Column(
            children: [
              Row(children: [
                //drawn a circle with border and a image inside
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.White,
                      width: 0.5,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(AppImages.User),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  'Oi, ',
                  style: TextStyle(
                    color: AppColors.White,
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                    fontFamily: 'Manrope',
                  ),
                ),
                const Text(
                  'Danielle',
                  style: TextStyle(
                    color: AppColors.White,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    fontFamily: 'Manrope',
                  ),
                ),
              ]),
              const SizedBox(height: 36),
              SizedBox(
                width: double.infinity,
                height: 32,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Pesquisar...',
                    hintStyle: const TextStyle(
                      color: AppColors.White,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: 'Manrope',
                    ),
                    prefixIcon: SvgPicture.asset(
                      AppIcons.Search,
                      width: 12,
                      height: 12,
                      fit: BoxFit.scaleDown,
                    ),
                    filled: true,
                    fillColor: AppColors.White.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 8,
                    ),
                  ),
                  style: const TextStyle(
                    color: AppColors.White,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: 'Manrope',
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                'Bem vindo!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.White,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  fontFamily: 'Manrope',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Para iniciar a configuração primeiro crie um grupo.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.White,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  fontFamily: 'Manrope',
                ),
              ),
              const Spacer(),
              const Row(
                children: [
                  HomeButton('Dispositivo'),
                  Spacer(),
                  HomeButton('Grupo')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  final String label;
  const HomeButton(
    this.label, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 36 - 8,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            backgroundColor: AppColors.White.withOpacity(0.1),
            elevation: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.White,
                fontWeight: FontWeight.w400,
                fontSize: 15,
                fontFamily: 'Roboto',
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              AppIcons.Add,
              width: 12,
              height: 12,
              fit: BoxFit.scaleDown,
            ),
          ],
        ),
      ),
    );
  }
}
