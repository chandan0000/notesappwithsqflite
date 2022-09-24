import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class ThemeConfug {
  static final lightMode = FlexThemeData.light(
    scheme: FlexScheme.barossa,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 20,
    appBarOpacity: 0.95,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      blendOnColors: false,
      inputDecoratorRadius: 24.0,
      chipSchemeColor: SchemeColor.primary,
      tabBarItemSchemeColor: SchemeColor.onPrimary,
      bottomNavigationBarElevation: 5.5,
      navigationBarSelectedLabelSchemeColor: SchemeColor.onSurfaceVariant,
      navigationBarUnselectedLabelSchemeColor: SchemeColor.surfaceTint,
      navigationBarSelectedIconSchemeColor: SchemeColor.onSurfaceVariant,
      navigationBarUnselectedIconSchemeColor: SchemeColor.surfaceTint,
      navigationBarIndicatorOpacity: 0.39,
      navigationBarOpacity: 0.10,
      navigationBarLabelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    // useMaterial3: true,
    // To use the playground font, add GoogleFonts package and uncomment
    // fontFamily: GoogleFonts.notoSans().fontFamily,
  );
  static final darkMode = FlexThemeData.dark(
    scheme: FlexScheme.barossa,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 15,
    appBarOpacity: 0.90,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 30,
      inputDecoratorRadius: 24.0,
      chipSchemeColor: SchemeColor.primary,
      bottomNavigationBarElevation: 5.5,
      navigationBarSelectedLabelSchemeColor: SchemeColor.onSurfaceVariant,
      navigationBarUnselectedLabelSchemeColor: SchemeColor.surfaceTint,
      navigationBarSelectedIconSchemeColor: SchemeColor.onSurfaceVariant,
      navigationBarUnselectedIconSchemeColor: SchemeColor.surfaceTint,
      navigationBarIndicatorOpacity: 0.39,
      navigationBarOpacity: 0.10,
      navigationBarLabelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    // useMaterial3: true,
    // To use the playground font, add GoogleFonts package and uncomment
    // fontFamily: GoogleFonts.notoSans().fontFamily,
  );
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,
}
