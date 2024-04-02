import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lone_number/common/theme/bloc/theme_bloc.dart';

import '../colors/lone_number_colors.dart';
import '../theme/theme_constants.dart';

class LoneNumberNav extends StatelessWidget {
  const LoneNumberNav({super.key, required this.navMethod});
  final Function navMethod;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DarkModeBloc>(
      create: (context) => DarkModeBloc(),
      child: navBloc(),
    );
  }

  Widget navBloc() {
    return Container(
      color: LoneNumberColors.defaultBackgroundPage,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                SizedBox(
                    width: 80, child: Image.asset('assets/images/logo.png')),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lone Number',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: LoneNumberColors.defaultDarkText),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: switchToDark(),
          )
        ],
      ),
    );
  }

  Widget switchToDark() {
    return BlocBuilder<DarkModeBloc, DarkModeState>(
      builder: (context, state) {
        return Switch.adaptive(
          value: DarkModeSwitch.isDarkMode,
          onChanged: (value) {
            navMethod();
          },
        );
      },
    );
  }
}
