import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:munch_login_application/constants/app_colors.dart';
import 'package:munch_login_application/presentation/widgets/initails_widget.dart';
import 'package:munch_login_application/presentation/widgets/employee_icon.dart';
import 'package:munch_login_application/presentation/widgets/employee_initial.dart';

import '../../constants/app_tex_styles.dart';

class EmployeeInfo extends StatelessWidget {
  final String? name;
  final String? surname;
  final String? address;
  final VoidCallback? onTap;

  const EmployeeInfo({
    this.onTap,
    required this.name,
    required this.surname,
     this.address,
    super.key,
  });

  @override
  @override
  Widget build(BuildContext context) {
    // Extract the first letters

    return Padding(
      padding: const EdgeInsets.only(top: 20 , right: 20 , left: 20),
      child: Row(
        children: [
          Initials(
            textColor: AppColors.backgroundText,
              name: name ?? "Jim", surname: surname ?? "Joe"),
          const SizedBox(width: 8),
            Expanded(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${name ?? "Jim"}'s Place" , style: AppTextStyles.title),
                    Text(address ?? "22 Burtan Road" ,style: AppTextStyles.title.copyWith(fontWeight: FontWeight.normal)),
                    ]
                ),
                UserIcon(
                  width: 25,
                  height: 25,
                  onClick: onTap,
                  backgroundColor: AppColors.button,
                  iconColor: AppColors.white,
                  path: "More, Kebab.svg",
                  showBackground: true,
                ),
              ],
             ),
           )
        ],
      ),
    );
  }
}
