import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/app_icons.dart';
import '../new_gateway.dart';

class StartConfiguration extends StatelessWidget {
  final Function startConfiguration;

  const StartConfiguration({super.key, required this.startConfiguration});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Bem vindo ao assistente de configuração',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w800,
              fontFamily: 'Manrope',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 38,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Clique em próximo para continuar e siga o passo a passo para configurar um novo gateway.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontFamily: 'Manrope',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          TextButton(
            onPressed: () async {
              final connectivityResult =
                  await Connectivity().checkConnectivity();

              if (!context.mounted) return;
              if (connectivityResult != ConnectivityResult.wifi) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => EnableWifiDialog(
                    onDelete: () {},
                  ),
                );

                return;
              }

              startConfiguration();
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              elevation: 0,
              foregroundColor: Colors.transparent,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Próximo',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Manrope',
                    color: Colors.white,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, 1),
                  child: SvgPicture.asset(
                    AppIcons.Arrow,
                    height: 24,
                    fit: BoxFit.fitHeight,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
