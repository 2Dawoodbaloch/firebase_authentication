import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';

final lightTheme = ThemeData(
  textTheme: GoogleFonts.poppinsTextTheme(),
  useMaterial3: false,
  brightness: Brightness.light,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondary,
    error: AppColors.error,
    onError: AppColors.onError,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,

  ),
);
