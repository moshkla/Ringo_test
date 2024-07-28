import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_test/core/extensions/context_extension.dart';
import 'package:ringo_test/core/extensions/num_extensions.dart';
import 'package:ringo_test/core/resources/resources.dart';
import 'package:ringo_test/core/router/routing_utils.dart';
import 'package:ringo_test/shared/widgets/general_app_bar.dart';
import 'package:ringo_test/shared/widgets/primary_button.dart';

import '../../../core/constants/app_colors.dart';
import '../cubit/base_bloc.dart';
import '../cubit/base_state.dart';
import '../data/base_data.dart';

class BasePage extends StatefulWidget {
  final int? baseIndex;

  const BasePage({super.key, this.baseIndex});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> with RouteAware {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseCubit, BaseState>(
      bloc: BaseCubit.to,
      builder: (context, state) => Scaffold(
        appBar: GeneralAppBar(
          title: baseData[state.selectedIndex].name,
        ),
        drawer: const Drawer(),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 45,
                            child: Stack(
                              children: [
                                Center(
                                  child: Text(
                                    'Choose Date',
                                    style: context.textTheme.headlineLarge,
                                  ),
                                ),
                                Align(
                                    alignment: AlignmentDirectional.topEnd,
                                    child: IconButton(
                                        onPressed: () {
                                          RoutingUtils.router.pop();
                                        },
                                        icon: const Icon(Icons.close)))
                              ],
                            ),
                          ),
                          const Divider(),
                          Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: AppColors.primaryColor,

                                onPrimary: Colors.white, // header text color
                              ),
                            ),
                            child: CalendarDatePicker(
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now()
                                    .subtract(const Duration(days: 364)),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 364)),
                                onDateChanged: (change) {}),
                          ),
                          const Divider(),
                          16.space,
                          PrimaryButton(
                            title: 'Continue',
                            onPressed: () {
                              RoutingUtils.router.pop();
                            },
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          child: SvgPicture.asset(SVGAssets.addFloat),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: baseData[state.selectedIndex].widget,
        bottomNavigationBar: BottomAppBar(
          elevation: 0,

          // color: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 10),
          shadowColor: Colors.red,
          shape: const AutomaticNotchedShape(

            RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16.0),
              ),
            ),
          ),
          child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.white,
              onTap: (value) => BaseCubit.to.currentIndex = value,
              currentIndex: state.selectedIndex,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                ...baseData.map((element) => BottomNavigationBarItem(
                      icon: element.icon,
                      activeIcon: element.iconActive,
                      label: element.name,
                    )),
              ]),
        ),
      ),
    );
  }
}
