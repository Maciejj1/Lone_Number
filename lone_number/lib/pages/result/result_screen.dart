import 'package:flutter/material.dart';
import 'package:lone_number/common/colors/lone_number_colors.dart';
import 'package:lone_number/pages/widgets/result_widget.dart';
import 'package:provider/provider.dart';

import '../../config/providers/outlier_provider.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final result = Provider.of<OutlierProvider>(context).outlier;

    return Scaffold(
      backgroundColor: LoneNumberColors.defaultBackgroundPage,
      appBar: AppBar(
        title: Text('Twoja wartość odstająca'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color(0xFF8C67F4), Color(0xFFFFA4CF)],
            ),
          ),
        ),
      ),
      body: SafeArea(child: ResultWidget(result!)),
    );
  }
}
