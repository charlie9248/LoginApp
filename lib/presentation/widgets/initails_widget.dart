import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:munch_login_application/presentation/widgets/employee_initial.dart';

import '../../constants/app_colors.dart';

class Initials extends StatelessWidget {
  final String name;
  final String surname;
  final Color? color;
  final Color? textColor;

   const Initials({
  super.key,
     this.color = AppColors.white,
     required this.name,
     required this.surname,
     this.textColor = AppColors.white
   });



  @override
  Widget build(BuildContext context) {
    String firstInitial = name[0];
    String secondInitial = surname[0];
    return  Container(
      height: 55,
      width: 55,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserInitialLetter(
              color: textColor,
              initial: firstInitial,
            ),

            const SizedBox(width: 1),
            // Text with full name
            UserInitialLetter(
              color: textColor,
              initial: secondInitial,
            ),
          ],
        ));
  }
}
