import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lone_number/common/helpers/lone_number_nav.dart';
import 'package:lone_number/common/styles/lone_number_styles.dart';
import 'package:provider/provider.dart';

import '../../common/colors/lone_number_colors.dart';
import '../../common/theme/bloc/theme_bloc.dart';
import '../../common/theme/theme_constants.dart';
import '../../config/models/number_list_model.dart';
import '../../config/providers/outlier_provider.dart';
import '../../services/outlier_service.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: LoneNumberColors.defaultBackgroundPage,
        body: SafeArea(
            child: BlocProvider<DarkModeBloc>(
          create: (context) => DarkModeBloc(),
          child: resultBody(),
        )));
  }

  Widget resultBody() {
    var loneNumberStyles = LoneNumberStyles(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        navBloc(),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 0.2,
                  child: Text('Wprowadź tablicę znaków aby sprawdzić wartość N',
                      textAlign: TextAlign.center,
                      style: loneNumberStyles.loneNumberTitleStyle),
                ),
              ],
            ),
            Gap(40),
            textFieldBloc(),
          ],
        ),
        buttonBloc(),
        Gap(10)
      ],
    );
  }

  Widget textFieldBloc() {
    var loneNumberStyles = LoneNumberStyles(context);

    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 50,
          child: TextFormField(
            textAlignVertical: TextAlignVertical.bottom,
            controller: _inputController,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.numbers),
              iconColor: Color(0xFF8C67F4),
              prefixIconColor: Color(0xFF8C67F4),
              hintText: "Wpisz ciąg znaków(po przecinku)",
              hintStyle: loneNumberStyles.loneNumberInputTextStyles,
              focusedBorder: loneNumberStyles.loneNumberInputBorderStyle,
              enabledBorder: loneNumberStyles.loneNumberInputBorderStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonBloc() {
    var loneNumberStyles = LoneNumberStyles(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: ElevatedButton(
        style: loneNumberStyles.loneNumberStyleButtonStyle,
        onPressed: () {
          final inputText = _inputController.text;
          final numbers =
              inputText.split(',').map((e) => int.parse(e.trim())).toList();

          final outlier = OutlierService().findOutlier(NumberList(numbers));
          Provider.of<OutlierProvider>(context, listen: false).outlier =
              outlier;
          GoRouter.of(context).go('/home/result');
        },
        child: Ink(
          decoration: loneNumberStyles.loneNumberStyleButtonContainerStyle,
          child: Container(
            width: double.infinity,
            height: 50,
            alignment: Alignment.center,
            child: const Text(
              'Oblicz Wartość Odstającą',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
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
            setState(() {});
            BlocProvider.of<DarkModeBloc>(context).add(ToggleDarkModeEvent());
          },
        );
      },
    );
  }
}
