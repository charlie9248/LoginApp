import 'package:flutter/material.dart';
import 'package:munch_login_application/constants/app_colors.dart';

class AppTextStyles {
  static const String konnectFontFamily = 'Konnect';

  static const TextStyle h1 = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w400,
    fontFamily: konnectFontFamily,
    color: AppColors.white,
  );

  static const TextStyle title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: konnectFontFamily,
    color: AppColors.white
  );

  static const TextStyle subheading = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: konnectFontFamily,
  );

  static const TextStyle input = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: konnectFontFamily,
  );

  static const TextStyle pinPad = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: konnectFontFamily,
  );
}
