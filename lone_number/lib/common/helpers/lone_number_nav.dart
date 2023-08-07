import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lone_number/common/theme/bloc/theme_bloc.dart';

import '../theme/theme_constants.dart';

class LoneNumberNav extends StatefulWidget {
  const LoneNumberNav({super.key});

  @override
  State<LoneNumberNav> createState() => _LoneNumberNavState();
}

class _LoneNumberNavState extends State<LoneNumberNav> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DarkModeBloc>(
      create: (context) => DarkModeBloc(),
      child: navBloc(),
    );
  }

  Widget navBloc() {
    return Container(
      color: Colors.amber,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                SizedBox(
                    width: 80, child: Image.asset('assets/images/logo.png')),
              ],
            ),
          ),
          switchToDark()
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
            setState(() {});
            BlocProvider.of<DarkModeBloc>(context).add(ToggleDarkModeEvent());
          },
        );
      },
    );
  }
}
