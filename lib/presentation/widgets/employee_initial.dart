

import 'package:flutter/cupertino.dart';
import 'package:munch_login_application/constants/app_colors.dart';
import 'package:munch_login_application/constants/app_tex_styles.dart';

class UserInitialLetter extends StatelessWidget {

  final String initial;
  final TextStyle? style;
  final Color? color;


  const UserInitialLetter({
    required this.initial,
    this.style,
    this.color = AppColors.backgroundText,
    super.key});


  @override
  Widget build(BuildContext context) {
    return  Text(
      initial,
      style: AppTextStyles.title.copyWith(color: color , fontWeight: FontWeight.w800 ,),
    );
  }
}
