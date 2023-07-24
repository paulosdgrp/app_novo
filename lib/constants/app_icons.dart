class AppIcons {
  static const String _path = 'assets/icons/';

  static String _buildPath(String name, [String format = 'svg']) =>
      '$_path$name.$format';

  static String Add = _buildPath('add');
  static String Arrow = _buildPath('arrow');
  static String ArrowLeft = _buildPath('arrow_left');
  static String Close = _buildPath('close');
  static String ClosedEye = _buildPath('closed_eye');
  static String Done = _buildPath('done');
  static String Edit = _buildPath('edit');
  static String Facebook = _buildPath('facebook', 'png');
  static String Google = _buildPath('google', 'png');
  static String Failded = _buildPath('failded');
  static String KebabDots = _buildPath('kebab_dots');
  static String OpenEye = _buildPath('open_eye');
  static String Pending = _buildPath('pending');
  static String QrCode = _buildPath('qr_code');
  static String Search = _buildPath('search');
  static String Trash = _buildPath('trash');
  static String Triangle = _buildPath('triangle');
}
