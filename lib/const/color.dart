// NOTE: To create an original color panel,
//specify the base color at the following site.
// http://mcg.mbitson.com

part of constants;

class AppColors {
  AppColors._();

  static const MaterialColor blue = MaterialColor(
    _pinkPrimaryValue,
    <int, Color>{
      50: Color(0xFFFFEAEE),
      100: Color(0xFF8FC1F1),
      200: Color(0xFF6A98C7),
      300: Color(0xFF79A3E7),
      400: Color(0xFF527394),
      500: Color(_pinkPrimaryValue),
      600: Color(0xFF48637D),
      700: Color(0xFF3A5671),
      800: Color(0xFF32495A),
      900: Color(0xFF273A49),
    },
  );
  static const int _pinkPrimaryValue = 0xFF4A638C;

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
  static const Color grey = Color(0xFFCACACA);
}
