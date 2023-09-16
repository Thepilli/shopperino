import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTextTheme {
  //Simple text theme
  static TextTheme get lightTextTheme {
    return TextTheme(
      titleLarge: AppTextStyles.titleLarge.copyWith(color: AppColors.txtDark),
      titleMedium: AppTextStyles.titleMedium.copyWith(color: AppColors.txtDark),
      titleSmall: AppTextStyles.titleSmall.copyWith(color: AppColors.txtDark),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.txtDark),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.txtDark),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.txtDark),
    );
  }

  //Dark text theme
  static TextTheme get darkTextTheme {
    return TextTheme(
      titleLarge: AppTextStyles.titleLarge.copyWith(color: AppColors.txtLight),
      titleMedium: AppTextStyles.titleMedium.copyWith(color: AppColors.txtLight),
      titleSmall: AppTextStyles.titleSmall.copyWith(color: AppColors.txtLight),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.txtLight),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.txtLight),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.txtLight),
    );
  }
}
