import 'dart:async';
import 'dart:math' as math;

import 'package:app/constants/app_colors.dart';
import 'package:app/views/login/widgets/forgot_password.dart';
import 'package:app/views/login/widgets/horizontal_or_line.dart';
import 'package:app/views/login/widgets/login_button.dart';
import 'package:app/views/login/widgets/login_text_form_field.dart';
import 'package:app/views/login/widgets/login_title.dart';
import 'package:app/views/login/widgets/sso_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/animate.dart';
import 'package:flutter_animate/effects/effects.dart';

import '../../constants/app_images.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  route() {
    // Navigator.pushReplacementNamed(context, '/login');
  }

  void _navigateToHome() async => Timer(const Duration(seconds: 3), route);

  @override
  Widget build(BuildContext context) {
    final scaleFactor = MediaQuery.of(context).size.height / 640;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.Background),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.PrimaryDark.withOpacity(0.70),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.LogoWhite, height: 68),
              ],
            ),
          ).animate().slide(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                begin: const Offset(0, 0.25),
                end: const Offset(0, -0.32),
              ),
          OverflowBox(
            maxHeight: MediaQuery.of(context).size.width * 2,
            maxWidth: MediaQuery.of(context).size.width * 2,
            child: Stack(children: [
              Center(
                child: Transform.translate(
                  offset: Offset(0, MediaQuery.of(context).size.height * 0.30),
                  child: Transform.rotate(
                    angle: math.pi / 4,
                    child: Container(
                      width: 500 * scaleFactor,
                      height: 500 * scaleFactor,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.White),
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Transform.translate(
                      offset:
                          Offset(0, MediaQuery.of(context).size.height * -0.15),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 50, right: 50),
                          child: Column(children: [
                            LoginTitle(),
                            SizedBox(height: 24),
                            LoginTextFormField('E-mail'),
                            SizedBox(height: 16),
                            LoginTextFormField('Senha'),
                            SizedBox(height: 6),
                            ForgotPassword(),
                            SizedBox(height: 16),
                            LoginButton(),
                            HorizontalOrLine(
                              label: 'ou continue com',
                              height: 36,
                            ),
                            SizedBox(height: 4),
                            SsoFooter(),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Não tem conta?',
                                  style: TextStyle(
                                    color: AppColors.Grey,
                                    fontSize: 11,
                                  ),
                                ),
                                Text(
                                  ' Cadastrar-se',
                                  style: TextStyle(
                                    color: AppColors.Primary,
                                    fontSize: 11,
                                  ),
                                )
                              ],
                            )
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ).animate().fadeIn(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn),
        ],
      ),
    );
  }
}
