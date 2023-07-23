class AppImages {
  static const String _path = 'assets/images/';

  static String _buildPath(String name, [String format = 'png']) =>
      '$_path/$name.$format';

  static String Background = _buildPath('background');
  static String DeviceConfigComplete = _buildPath('device_config_complete');
  static String Logo = _buildPath('logo');
  static String LogoWhite = _buildPath('logo_white');
  static String User = _buildPath('user');
}

