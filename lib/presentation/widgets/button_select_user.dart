import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:munch_login_application/constants/app_string_constant.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_tex_styles.dart';

class ButtonSelectUser extends StatelessWidget {
  final String? hintText;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final VoidCallback? onTap;

  const ButtonSelectUser({
    super.key,
    this.hintText,
    this.leadingIcon,
    this.trailingIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(
            color: Colors.white,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            if (leadingIcon != null)
              Padding(
                padding: const EdgeInsets.all(3),
                child: leadingIcon,
              ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                hintText ?? StringConstants.selectEmployee,
                style: AppTextStyles.input.copyWith(color: AppColors.backgroundText),
              ),
            ),
            if (trailingIcon != null)
              Padding(
                padding: const EdgeInsets.all(3),
                child: trailingIcon,
              ),
          ],
        ),
      ),
    );
  }
}
