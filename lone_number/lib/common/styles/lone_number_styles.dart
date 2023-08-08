import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:lone_number/common/colors/lone_number_colors.dart';

class LoneNumberStyles {
  late LoneNumberColors loneNumberColors;
  LoneNumberStyles(BuildContext context);
  void init(BuildContext context) {}

  TextStyle get loneNumberTitleStyle => TextStyle(
      color: LoneNumberColors.defaultDarkText,
      fontFamily: 'Inter',
      fontSize: 22,
      fontWeight: FontWeight.w800);
  ButtonStyle get loneNumberStyleButtonStyle => ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      );
  BoxDecoration get loneNumberStyleButtonContainerStyle => BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF8C67F4), Color(0xFFFFA4CF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(50),
      );
  GradientOutlineInputBorder get loneNumberInputBorderStyle =>
      GradientOutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              LoneNumberColors.gradientOneColor,
              LoneNumberColors.gradientSecondColor
            ],
          ),
          width: 2);
  TextStyle get loneNumberInputTextStyles =>
      TextStyle(color: LoneNumberColors.defaultGreyText, fontSize: 15);
  TextStyle get loneNumberResultTextStyles => const TextStyle(
        fontSize: 80.0,
      );
  TextStyle get loneNumberButtonText => const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );
}
