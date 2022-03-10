// NOTE: To create an original color panel,
//specify the base color at the following site.
// http://mcg.mbitson.com

part of constants;

class AppColors {
  AppColors._();

  static const MaterialColor pink = MaterialColor(
    _pinkPrimaryValue,
    <int, Color>{
      50: Color(0xFFFFEAEE),
      100: Color(0xFFFFCBD4),
      200: Color(0xFFFFA8B7),
      300: Color(0xFFFF859A),
      400: Color(0xFFFF6A84),
      500: Color(_pinkPrimaryValue),
      600: Color(0xFFFF4966),
      700: Color(0xFFFF405B),
      800: Color(0xFFFF3751),
      900: Color(0xFFFF273F),
    },
  );
  static const int _pinkPrimaryValue = 0xFFFF506E;

  static const MaterialColor pinkAccent = MaterialColor(
    _pinkAccent,
    <int, Color>{
      100: Color(0xFFFFFFFF),
      200: Color(_pinkAccent),
      400: Color(0xFFFFD4D9),
      700: Color(0xFFFFBBC1),
    },
  );
  static const int _pinkAccent = 0xFFFFFFFF;

  /// #FFFFFF
  static const Color white = Color(0xFFFFFFFF);

  /// #FF0000
  static const Color black = Color(0xFF000000);

  /// #9E9E9E
  static const Color grey = Color(0xFF9E9E9E);
}
