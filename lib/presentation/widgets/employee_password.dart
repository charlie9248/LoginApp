import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:munch_login_application/state/bloc/auth/authentication_bloc.dart';
import 'package:munch_login_application/models/Employee.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


import '../../state/bloc/auth/authentication_event.dart';
import '../../state/bloc/auth/authentication_state.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_tex_styles.dart';
import 'numeric_keyboard.dart';

class UserPassword extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final FocusNode? focusNode;
  final Employee? employee;

  const UserPassword({
    super.key,
    this.controller,
    this.hintText,
    this.obscureText = true,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.leadingIcon,
    this.trailingIcon,
    this.focusNode,
    this.employee
  });

  @override
  State<UserPassword> createState() => _UserPasswordState();
}

class _UserPasswordState extends State<UserPassword> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
   Color statusColor = AppColors.primaryColor;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                color: Colors.white,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.only(right: 20 , left: 20),
            child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {

                if (state.status == AuthenticationStatus.unknown) {

                  statusColor = AppColors.primaryColor;

                } else if (state.status == AuthenticationStatus.authenticated) {
                  statusColor = AppColors.secondaryColor;
                }
                else if (state.status == AuthenticationStatus.unauthenticated) {
                  statusColor = AppColors.errorColor;
                }
              },
              builder: (BuildContext context, AuthenticationState state) {
                return  Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    if (widget.leadingIcon != null)
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: widget.leadingIcon,
                      ),
                    const SizedBox(
                      width: 10,
                    ),
                     Text("Pin :" , style: AppTextStyles.input.copyWith(color: AppColors.backgroundText)),
                    Expanded(
                      child: Transform.translate(
                        offset: const Offset(-20, 7),
                        child: PinCodeTextField(
                          onCompleted: (pin) {
                            if (pin.length >= 3) {
                              context.read<AuthenticationBloc>().add(AuthenticationSubmit(pin ,widget.employee?.name ?? ""));
                            }
                          },
                          obscuringWidget: Container(
                            color: statusColor,
                            width: 10,
                            height: 10,
                          ),
                          cursorColor: AppColors.primaryColor,
                          mainAxisAlignment: MainAxisAlignment.end,
                          appContext: context,
                          length: 4,
                          focusNode: _focusNode,
                          controller: _controller,
                          obscureText: widget.obscureText,
                          keyboardType: TextInputType.none,
                          onChanged: widget.onChanged,
                          pinTheme: PinTheme(
                            borderWidth: 0,
                            shape: PinCodeFieldShape.circle,
                            fieldHeight: 20,
                            fieldWidth: 30,
                            activeFillColor: statusColor,
                            selectedFillColor: statusColor,
                            inactiveFillColor: AppColors.primaryAccent,
                            activeColor: Colors.transparent,
                            selectedColor: Colors.transparent,
                            inactiveColor: Colors.transparent,
                          ),
                          backgroundColor: Colors.transparent,
                          enableActiveFill: true,
                          animationType: AnimationType.fade,
                          animationDuration: const Duration(milliseconds: 300),
                        ),
                      ),
                    ),
                    if (widget.trailingIcon != null)
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: widget.trailingIcon,
                      ),
                  ],
                );
              },
            ),
          ),
          NumericKeypad(controller: _controller),
        ],
      ),
    );
  }
}
