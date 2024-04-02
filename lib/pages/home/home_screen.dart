import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lone_number/bloc/outlier_bloc.dart';
import 'package:lone_number/common/helpers/lone_number_nav.dart';
import 'package:lone_number/common/helpers/lone_number_snackbar.dart';
import 'package:lone_number/common/styles/lone_number_styles.dart';
import 'package:lone_number/pages/widgets/lone_number_button.dart';
import 'package:lone_number/pages/widgets/lone_number_text_field.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../common/colors/lone_number_colors.dart';
import '../../common/theme/bloc/theme_bloc.dart';
import '../../config/models/number_list_model.dart';
import '../../services/outlier_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
            child: MultiBlocProvider(
          providers: [
            BlocProvider<DarkModeBloc>(
              create: (context) => DarkModeBloc(),
            ),
            BlocProvider<OutlierBloc>(
              create: (context) => OutlierBloc(OutlierService()),
            ),
          ],
          child: resultBody(),
        )));
  }

  Widget resultBody() {
    var loneNumberStyles = LoneNumberStyles(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LoneNumberNav(navMethod: () {
          setState(() {});
          BlocProvider.of<DarkModeBloc>(context).add(ToggleDarkModeEvent());
        }),
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
            const Gap(40),
            LoneNumberTextField(
              inputController: _inputController,
            )
          ],
        ),
        LoneNumberButton(
          buttonMethod: () {
            final inputText = _inputController.text;
            final trimmedInput = inputText.replaceAll(RegExp(r'\s+'), '');
            if (trimmedInput.isEmpty ||
                !RegExp(r'^-?[\d,-]+$').hasMatch(trimmedInput)) {
              showTopSnackBar(
                Overlay.of(context),
                const LoneNumberSnackbar.error(
                  message: "Wprowadzono nieprawidłowy format danych",
                ),
              );
            } else {
              final numbers = trimmedInput
                  .split(',')
                  .map((e) => int.tryParse(e) ?? 0)
                  .toList();

              if (numbers.length < 3) {
                showTopSnackBar(
                  Overlay.of(context),
                  const LoneNumberSnackbar.error(
                    message: "Wpisałeś za krótki ciąg liczb",
                  ),
                );
              } else {
                // final sum = numbers.reduce((value, element) => value + element);
                // final minMaxSum = sum -
                //     numbers.reduce((min, value) => value < min ? value : min) -
                //     numbers.reduce((max, value) => value > max ? value : max);
                // final outlierValue = sum - minMaxSum;

                final outlierBloc = context.read<OutlierBloc>();
                outlierBloc.add(SearchEvent(NumberList(numbers)));
                GoRouter.of(context).go('/home/result');
              }
            }
          },
          buttonText: 'Oblicz Wartość Odstającą',
        ),
        const Gap(10)
      ],
    );
  }
}
