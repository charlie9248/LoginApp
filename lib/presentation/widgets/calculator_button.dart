import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    required this.text,
    this.onPressed,
    this.index,
    super.key,
  });

  final String text;
  final VoidCallback? onPressed;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.container,
          borderRadius: BorderRadius.only(
            topLeft: index == 0 ? const  Radius.circular(20) : const Radius.circular(0),
            topRight: index == 2 ? const Radius.circular(20) : const Radius.circular(0),
            bottomLeft: const Radius.circular(0),
            bottomRight: const Radius.circular(0),
          ),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }
}
