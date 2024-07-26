import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:munch_login_application/constants/app_colors.dart';
import 'package:munch_login_application/constants/app_tex_styles.dart';
import 'package:munch_login_application/state/bloc/emp/employees_bloc.dart';
import 'package:munch_login_application/state/bloc/emp/employees_state.dart';
import 'package:munch_login_application/presentation/widgets/initails_widget.dart';
import 'package:munch_login_application/presentation/widgets/employee_icon.dart';
import '../../constants/app_string_constant.dart';
import '../../models/Employee.dart';
import '../../state/bloc/emp/employees_event.dart';

class EmployeeList extends StatelessWidget {
  const EmployeeList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundText,
        body: BlocProvider(
          create: (context) => EmployeesBloc()..add(GetEmployees()),
          child: BlocBuilder<EmployeesBloc, EmployeesState>(
            builder: (context, state) {
              if (state.status == EmployeesStatus.success) {
                return Center(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 60,
                        left: 20,
                        right: 0,
                        child: Row(
                          children: [
                            UserIcon(
                              onClick: () {
                                Navigator.pop(context);
                              },
                              backgroundColor:
                              AppColors.errorColor.withOpacity(0.3),
                              iconColor: AppColors.errorColor,
                              path: "Close.svg",
                              showBackground: true,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                              Text(
                                StringConstants.selectAnEmployee,
                              style: AppTextStyles.title.copyWith(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        top: 160, // Adjust as needed
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30)),
                            color: AppColors.container,
                          ),
                          child: GroupedListView<Employee, String>(
                            elements: state.employees,
                            groupBy: (employee) => employee.name[0],
                            groupSeparatorBuilder: (String groupByValue) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Opacity(
                                opacity: 0.3,
                                child: Text(
                                  groupByValue,
                                  style:  const TextStyle(
                                    color: AppColors.backgroundText,
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            itemBuilder: (context, Employee employee) {
                              int index = state.employees.indexOf(employee);
                              return ListTile(
                                onTap: () {
                                  Navigator.pop(context , employee);
                                },
                                title: Row(
                                  children: [
                                    Initials(
                                      color: AppColors
                                          .colors[index % AppColors.colors.length],
                                      name: employee.name,
                                      surname: employee.surname,
                                    ),
                                    const SizedBox(width: 20),
                                    Text("${employee.name} ${employee.surname}" , style: AppTextStyles.title.copyWith(color: AppColors.backgroundText),),
                                  ],
                                ),
                              );
                            },
                            itemComparator: (employee1, employee2) =>
                                employee1.name.compareTo(employee2.name),
                            order: GroupedListOrder.ASC,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state.status == EmployeesStatus.initial) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const Center(child: Text(StringConstants.failedToLoadEmployees));
              }
            },
          ),
        ),
      ),
    );
  }
}
