part of constants;

final kLightThemeData = ThemeData(
  brightness: Brightness.light,
  primarySwatch: AppColors.pink,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: AppColors.pink,
  hintColor: Colors.grey,
  dividerTheme: const DividerThemeData(space: 1),
  scaffoldBackgroundColor: AppColors.white,
  primaryTextTheme: const TextTheme(
    subtitle1: TextStyle(
      color: AppColors.pink,
      fontSize: FontSize.small,
    ),
  ),
  appBarTheme: _kAppBarTheme.copyWith(
    color: AppColors.pink,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
);

final kDarkThemeData = ThemeData(
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: AppColors.pink[700],
  scaffoldBackgroundColor: Colors.grey[700],
  toggleableActiveColor: AppColors.pink,
  primaryTextTheme: const TextTheme(
    subtitle1: TextStyle(
      color: AppColors.pink,
      fontSize: FontSize.small,
    ),
  ),
  colorScheme: const ColorScheme.dark().copyWith(
    primary: AppColors.pink[400],
  ),
  appBarTheme: _kAppBarTheme.copyWith(
    color: AppColors.pink,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
);

const _kAppBarTheme = AppBarTheme(
  centerTitle: true,
);
