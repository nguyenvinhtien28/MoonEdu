part of constants;

final kLightThemeData = ThemeData(
  brightness: Brightness.light,
  primarySwatch: AppColors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: AppColors.blue,
  hintColor: Colors.grey,
  dividerTheme: const DividerThemeData(space: 1),
  scaffoldBackgroundColor: AppColors.white,
  primaryTextTheme: const TextTheme(
    subtitle1: TextStyle(
      color: AppColors.blue,
      fontSize: FontSize.small,
    ),
  ),
  appBarTheme: _kAppBarTheme.copyWith(
    color: AppColors.blue,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
);

final kDarkThemeData = ThemeData(
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: AppColors.blue[700],
  scaffoldBackgroundColor: Colors.grey[700],
  toggleableActiveColor: AppColors.blue,
  primaryTextTheme: const TextTheme(
    subtitle1: TextStyle(
      color: AppColors.blue,
      fontSize: FontSize.small,
    ),
  ),
  colorScheme: const ColorScheme.dark().copyWith(
    primary: AppColors.blue[400],
  ),
  appBarTheme: _kAppBarTheme.copyWith(
    color: AppColors.blue,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
);

const _kAppBarTheme = AppBarTheme(
  centerTitle: true,
);
