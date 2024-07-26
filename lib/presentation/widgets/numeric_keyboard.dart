import 'dart:io';

import 'package:flutter/material.dart';
import 'package:munch_login_application/constants/app_tex_styles.dart';

import '../../constants/app_colors.dart';

class NumericKeypad extends StatefulWidget {
  final TextEditingController controller;

  const NumericKeypad({super.key, required this.controller});

  @override
  State<NumericKeypad> createState() => _NumericKeypadState();
}

class _NumericKeypadState extends State<NumericKeypad> {
  late TextEditingController _controller;
  late TextSelection _selection;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller..addListener(_onSelectionChanged);
    _selection = _controller.selection;
  }

  @override
  void dispose() {
    _controller.removeListener(_onSelectionChanged);
    super.dispose();
  }

  void _onSelectionChanged() {
    setState(() {
      _selection = _controller.selection;
    });
  }

  // 1
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildButton('1' , index: 0 ),
            _buildButton('2'),
            _buildButton('3' , index: 2),
          ],
        ),
        Row(
          children: [
            _buildButton('4'),
            _buildButton('5'),
            _buildButton('6'),
          ],
        ),
        Row(
          children: [
            _buildButton('7'),
            _buildButton('8'),
            _buildButton('9'),
          ],
        ),
        Row(
          children: [
            _buildButton('Clear' , index: 10 , onPressed: _clear , color: AppColors.errorColor),
            _buildButton('0'),
            _buildButton('⌫', onPressed: _backspace),
          ],
        ),
      ],
    );
  }

  Widget _buildButton(String text, {VoidCallback? onPressed, int? index , Color? color = AppColors.backgroundText}) {
    return Expanded(
      child: Container(
        padding:  Platform.isIOS ?  const EdgeInsets.all(12) : const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(strokeAlign: 0.0 , color: AppColors.borderLine),
            borderRadius: BorderRadius.only(
                topLeft: index == 0
                    ? const Radius.circular(20)
                    : const Radius.circular(0),
                topRight: index == 2
                    ? const Radius.circular(20)
                    : const Radius.circular(0)),
            color: AppColors.lightGray , ),
        child: TextButton(
          onPressed: index == 9 ? onPressed ?? () => _clear() :  onPressed ?? () => _input(text),
          child: Text(text ,  style: AppTextStyles.title.copyWith(fontSize: 20 , color: color),),
        ),
      ),
    );
  }

  void _input(String text) {
    final value = _controller.text + text;
    _controller.text = value;
  }

  void _clear() {
    _controller.text = "";
  }

  void _backspace() {
    final value = _controller.text;
    if (value.isNotEmpty) {
      _controller.text = value.substring(0, value.length - 1);
    }
  }
}
