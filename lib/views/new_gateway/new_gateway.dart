import 'package:app/views/group/group.dart';
import 'package:app/views/new_gateway/widgets/start_configuration.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_stepper/easy_stepper.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_icons.dart';
import '../../models/gateway_device.dart';
import '../../shared/isensi_app_bar.dart';
import '../../shared/isensi_button.dart';

class NewGateway extends StatefulWidget {
  const NewGateway({super.key});
  static String routeName = '/new_gateway';

  @override
  State<NewGateway> createState() => _NewGatewayState();
}

class _NewGatewayState extends State<NewGateway> {
  late bool startConfiguration = true;
  late int activeStep = 0;
  late String pageTitle = 'Assistente de configuração';
  late List<GatewayDevice> devices = [
    GatewayDevice(
      name: 'Gateway I-Sensi_A28A72',
      mac: '00:00:00:00:00:00',
      ip: '192.168.0.1',
      version: '1.0.0',
      selected: false,
    ),
    GatewayDevice(
      name: 'Gateway I-Sensi_A28A73',
      mac: '00:00:00:00:00:00',
      ip: '192.168.0.3',
      version: '1.0.0',
      selected: false,
    ),
    GatewayDevice(
      name: 'Gateway I-Sensi_A28A74',
      mac: '00:00:00:00:00:00',
      ip: '192.168.0.4',
      version: '1.0.0',
      selected: false,
    ),
    GatewayDevice(
      name: 'Gateway I-Sensi_A28A75',
      mac: '00:00:00:00:00:00',
      ip: '192.168,0.5',
      version: '1.0.0',
      selected: false,
    ),
    GatewayDevice(
      name: 'Gateway I-Sensi_A28A76',
      mac: '00:00:00:00:00:00',
      ip: '192.168,0.6',
      version: '1.0.0',
      selected: false,
    ),
  ];

  _startConfiguration() {
    setState(() {
      startConfiguration = true;
      pageTitle = 'Assistente de configuração';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IsensiAppBar(
        routeName: Group.routeName,
        title: pageTitle,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: AppColors.BackgroundGradient,
        ),
        child: !startConfiguration
            ? StartConfiguration(startConfiguration: _startConfiguration())
            : SizedBox(
                height: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      clipBehavior: Clip.none,
                      child: EasyStepper(
                        activeStep: activeStep,
                        lineLength: 60,
                        lineSpace: 0,
                        lineType: LineType.dotted,
                        defaultLineColor: Colors.white,
                        finishedLineColor: Colors.orange,
                        activeStepTextColor: Colors.black87,
                        finishedStepTextColor: Colors.black87,
                        internalPadding: 8,
                        showLoadingAnimation: false,
                        stepRadius: 12,
                        showStepBorder: false,
                        lineThickness: 3,
                        steps: [
                          isensiStep(activeStep, 0, 'Dispositivos'),
                          isensiStep(activeStep, 1, 'Configuração'),
                          isensiStep(activeStep, 2, 'Rede'),
                          isensiStep(activeStep, 3, 'Pronto!'),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Gateways encontrados:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Manrope',
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color:
                                      AppColors.PearlNightBlue.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    ...devices.map((device) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12.0),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 6),
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: AppColors.Smoke
                                                      .withOpacity(0.14),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            width: double.infinity,
                                            height: 48,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setSelectedDevice(device);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: device.selected
                                                    ? AppColors.Tertiary
                                                    : Colors.transparent,
                                                elevation: 0,
                                                padding: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                padding: const EdgeInsets.only(
                                                    left: 8),
                                                child: Text(device.name,
                                                    textAlign: TextAlign.start,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Manrope',
                                                    )),
                                              ),
                                            ),
                                          ),
                                        )),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Text('oi'),
                          Text('oi'),
                          Text('oi'),
                        ][activeStep],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 64,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              if (activeStep > 0) {
                                setState(() {
                                  activeStep--;
                                });
                              }
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 4),
                              elevation: 0,
                              foregroundColor: Colors.transparent,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Transform.translate(
                                  offset: const Offset(0, 1),
                                  child: Transform.rotate(
                                    angle: 3.1415926535897932,
                                    child: SvgPicture.asset(
                                      AppIcons.Arrow,
                                      height: 24,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Anterior',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Manrope',
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              if (activeStep < 3) {
                                setState(() {
                                  activeStep++;
                                });
                              }
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 4),
                              elevation: 0,
                              foregroundColor: Colors.transparent,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  activeStep != 3 ? 'Próximo' : 'Finalizar',
                                  style: const TextStyle(
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
                    ),
                    const SizedBox(
                      height: 48,
                    )
                  ],
                ),
              ),
      ),
    );
  }

  void setSelectedDevice(GatewayDevice device) {
    return setState(() {
      for (var element in devices) {
        element.selected = false;
      }
      device.selected = true;
    });
  }
}



isensiStep(int activeStep, int index, String title) => EasyStep(
      customStep: CircleAvatar(
        radius: 12,
        child: CircleAvatar(
          radius: 12,
          backgroundColor:
              activeStep >= index ? AppColors.Tertiary : Colors.white,
          child: Text(
            '${index + 1}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ),
      customTitle: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w400,
          fontFamily: 'Manrope',
        ),
        textAlign: TextAlign.center,
      ),
    );

class EnableWifiDialog extends StatelessWidget {
  const EnableWifiDialog({
    required this.onDelete,
    super.key,
  });

  final void Function() onDelete;

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
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Spacer(),
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: SvgPicture.asset(AppIcons.Close)),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Ative o wifi e aperte o botão de configuração no seu gateway',
                style: TextStyle(
                  color: AppColors.UltramarineBlue,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  fontFamily: 'Manrope',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IsensiButton(
                      'Agora não',
                      fontSize: 12,
                      outline: true,
                      fontWeight: FontWeight.w600,
                      borderRadius: 12,
                      width: MediaQuery.of(context).size.width / 3 - 16,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const Spacer(),
                    IsensiButton(
                      'Ok',
                      fontSize: 12,
                      backgroundColor: AppColors.UltramarineBlue,
                      fontWeight: FontWeight.w600,
                      borderRadius: 12,
                      width: MediaQuery.of(context).size.width / 3 - 16,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
