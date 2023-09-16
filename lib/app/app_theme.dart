import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';
import 'app_text_theme.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryLight,
        secondary: AppColors.secondaryLight,
        error: AppColors.error,
        background: AppColors.backgroundLight,
      ),
      scaffoldBackgroundColor: AppColors.scaffoldLight,
      primaryTextTheme: AppTextTheme.lightTextTheme,
      textTheme: AppTextTheme.lightTextTheme,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.backgroundLight,
        foregroundColor: AppColors.primaryLight,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.white,
        shadowColor: AppColors.bottomSheetShadowLight,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.white,
        shadowColor: AppColors.drawerShadowLight,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundLight,
      ),
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: AppColors.primaryLight)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: AppColors.primaryLight)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: AppColors.primaryLight)),
          labelStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.primaryLight),
          hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.primaryLight),
          filled: true,
          fillColor: AppColors.formFillLight,
          alignLabelWithHint: true),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryDark,
        secondary: AppColors.secondaryDark,
        error: AppColors.error,
        background: AppColors.backgroundDark,
      ),
      scaffoldBackgroundColor: AppColors.scaffoldDark,
      primaryTextTheme: AppTextTheme.darkTextTheme,
      textTheme: AppTextTheme.darkTextTheme,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.backgroundDark,
        foregroundColor: AppColors.primaryDark,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.bottomSheetDark,
        shadowColor: AppColors.bottomSheetShadowDark,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.drawerDark,
        shadowColor: AppColors.drawerShadowDark,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundDark,
      ),
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: AppColors.primaryDark)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: AppColors.primaryDark)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: AppColors.primaryDark)),
          labelStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.primaryDark),
          hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.primaryDark),
          filled: true,
          fillColor: AppColors.formFillDark,
          alignLabelWithHint: true),
    );
  }
}
