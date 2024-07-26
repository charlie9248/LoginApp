import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:munch_login_application/state/bloc/authentication_bloc.dart';

import 'package:munch_login_application/state/bloc/employees_bloc.dart'; // Import other blocs if needed
import 'package:munch_login_application/constants/app_colors.dart';
import 'package:munch_login_application/state/bloc/employees_state.dart';
import 'package:munch_login_application/models/Employee.dart';
import 'package:munch_login_application/presentation/widgets/button_select_user.dart';
import 'package:munch_login_application/presentation/widgets/employee_icon.dart';
import 'package:munch_login_application/presentation/widgets/employee_info.dart';
import 'package:munch_login_application/presentation/widgets/employee_password.dart';

import 'constants/app_string_constant.dart';
import 'constants/app_tex_styles.dart';
import 'presentation/views/employee_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: AppColors.backgroundText,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.backgroundText,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.backgroundText),
        useMaterial3: false,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationBloc(),
          ),
          BlocProvider(
            create: (context) =>
                EmployeesBloc(), // Add other BLoCs here if needed
          ),
        ],
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Employee? emp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundText,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.zero,
            child: SizedBox(
              child: BlocBuilder<EmployeesBloc, EmployeesState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EmployeeInfo(
                        onTap: () {
                          _showAlertDialog(context);
                        },
                        name: emp?.name,
                        surname: emp?.surname,
                        address: emp?.address,
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        child: Text(
                          StringConstants.welcomeText,
                          style: AppTextStyles.h1,
                        ),
                      ),
                      ButtonSelectUser(
                        hintText: emp?.name,
                        leadingIcon: const UserIcon(
                          path: "User, Profile.svg",
                          showBackground: true,
                        ),
                        trailingIcon: const UserIcon(
                          path: 'Arrow, Right.svg',
                        ),
                        onTap: () async {
                          var employee = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EmployeeList()),
                          );

                          setState(() {
                            emp = employee ?? emp;
                          });
                        },
                      ),
                      UserPassword(
                        employee: emp,
                        leadingIcon: const UserIcon(
                          path: "Lock, Pin.svg",
                          showBackground: true,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ));
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Transform.translate(
          offset: Platform.isIOS ? const Offset(0, 235) : const Offset(0, 220),
          child: Dialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            backgroundColor: AppColors.white,
            insetPadding:
                const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: SizedBox(
                    height: Platform.isIOS ? 220 : 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.appInformation,
                              style: AppTextStyles.title
                                  .copyWith(color: AppColors.backgroundText),
                            ),
                            UserIcon(
                              width: 30,
                              height: 30,
                              onClick: () {
                                Navigator.pop(context);
                              },
                              backgroundColor:
                                  AppColors.errorColor.withOpacity(0.4),
                              iconColor: AppColors.errorColor,
                              path: "Close.svg",
                              showBackground: true,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: Platform.isIOS
                              ? const EdgeInsets.all(14)
                              : const EdgeInsets.all(10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.container),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                StringConstants.versionNumber,
                                style: AppTextStyles.subheading.copyWith(
                                    color: AppColors.backgroundText,
                                    fontSize: 16),
                              ),
                              Text(StringConstants.envText,
                                  style: AppTextStyles.subheading.copyWith(
                                      color: AppColors.backgroundText,
                                      fontSize: 16)),
                              Text(
                                "${StringConstants.deviceId} THVE-7HG67-6H9J-HFH9",
                                style: AppTextStyles.subheading.copyWith(
                                    color: AppColors.backgroundText,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            setState(() {  });
                          },
                          child: Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: AppColors.tertiaryColor.withOpacity(0.1),
                              border:
                                  Border.all(color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                    color: AppColors.tertiaryColor,
                                    FontAwesomeIcons.rotate),
                                SizedBox(width: 10,),
                                Text(
                                  StringConstants.resetText,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: AppColors.tertiaryColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<String?> getDeviceId() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      return androidInfo.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      return iosInfo.identifierForVendor;
    } else {
      return null;
    }
  }
}
