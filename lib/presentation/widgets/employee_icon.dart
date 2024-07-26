import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/app_colors.dart';

class UserIcon extends StatelessWidget {
  final String path;
  final bool showBackground;
  final double width;
  final double  height;
  final Color? iconColor;
  final Color? backgroundColor;
  final VoidCallback? onClick;

  const UserIcon({
    super.key,
    required this.path,
    this.showBackground = false,
    this.width = 40,
    this.height = 40,
    this.iconColor = AppColors.primaryColor,
    this.backgroundColor = AppColors.primaryAccent,
    this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        decoration: showBackground
            ? BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10), // optional radius
        )
            : null,
        padding: const EdgeInsets.all(10),
        child: SvgPicture.asset(
          'assets/$path',
          colorFilter:  ColorFilter.mode(iconColor!, BlendMode.srcIn),
          width: width, // Set desired width
          height: height, // Set desired height
        ),
      ),
    );
  }
}
