import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lone_number/common/colors/lone_number_colors.dart';
import 'package:lone_number/common/helpers/lone_number_appBar.dart';
import 'package:lone_number/pages/widgets/lone_number_result_content.dart';
import '../../bloc/outlier_bloc.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OutlierBloc, OutlierState>(
      builder: (context, state) {
        if (state is OutlierSuccess) {
          final result = state.result;

          return Scaffold(
            backgroundColor: LoneNumberColors.defaultBackgroundPage,
            appBar:
                const LoneNumberAppBar(appBarTitle: 'Twoja wartość odstająca'),
            body: SafeArea(child: ResultWidget(result)),
          );
        } else {
          return const CircularProgressIndicator.adaptive();
        }
      },
    );
  }
}
