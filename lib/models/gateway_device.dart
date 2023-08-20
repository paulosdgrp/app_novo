class GatewayDevice {
  final String name;
  final String mac;
  final String ip;
  final String version;
  late bool selected;

  GatewayDevice({
    required this.name,
    required this.mac,
    required this.ip,
    required this.version,
    this.selected = false,
  });
}