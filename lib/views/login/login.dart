import 'dart:math' as math;

import 'package:app/constants/app_colors.dart';
import 'package:app/shared/isensi_app_bar.dart';
import 'package:app/shared/isensi_button.dart';
import 'package:app/shared/isensi_text_form_field.dart';
import 'package:app/views/login/widgets/forgot_password.dart';
import 'package:app/views/login/widgets/horizontal_or_line.dart';
import 'package:app/views/login/widgets/login_title.dart';
import 'package:app/views/login/widgets/sso_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/animate.dart';
import 'package:flutter_animate/effects/effects.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../constants/app_images.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  final _loginFormKey = GlobalKey<FormBuilderState>();
  final _showPasswordNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final scaleFactor = MediaQuery.of(context).size.height / 640;
    return Scaffold(
      appBar: const IsensiAppBar(
        height: 0,
      ),
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
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: Column(children: [
                            const LoginTitle(),
                            const SizedBox(height: 24),
                            FormBuilder(
                              key: _loginFormKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  IsensiFormBuilderTextField(
                                    context: context,
                                    name: 'username',
                                    hintText: 'E-mail',
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(
                                        errorText: 'Este campo é obrigatório',
                                      ),
                                      FormBuilderValidators.email(
                                        errorText: 'E-mail inválido',
                                      )
                                    ]),
                                  ),
                                  const SizedBox(height: 16),
                                  ValueListenableBuilder(
                                    valueListenable: _showPasswordNotifier,
                                    builder: (BuildContext context,
                                            bool showPassword, child) =>
                                        IsensiFormBuilderTextField(
                                      context: context,
                                      name: 'password',
                                      hintText: 'Senha',
                                      obscureText: !showPassword,
                                      showPasswordNotifier:
                                          _showPasswordNotifier,
                                      showSuffixIcon: true,
                                      validator: FormBuilderValidators.compose(
                                        [
                                          FormBuilderValidators.required(
                                            errorText:
                                                'Este campo é obrigatório',
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // const SizedBox(height: 16),
                            // const IsensiTextFormField('Senha'),
                            const SizedBox(height: 6),
                            const ForgotPassword(),
                            const SizedBox(height: 16),
                            IsensiButton(
                              'Entrar',
                              width: 180,
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                if (_loginFormKey.currentState
                                        ?.saveAndValidate() ??
                                    false) {
                                  var formValue =
                                      _loginFormKey.currentState!.value;
                                  String username = formValue['username'];
                                  String password = formValue['password'];
                                  Navigator.pushNamed(context, '/home');
                                }
                              },
                            ),
                            const HorizontalOrLine(
                              label: 'ou continue com',
                              height: 36,
                            ),
                            const SizedBox(height: 4),
                            const SsoFooter(),
                            const SizedBox(height: 16),
                            const Row(
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
