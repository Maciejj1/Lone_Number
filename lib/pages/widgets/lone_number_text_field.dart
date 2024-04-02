import 'package:flutter/material.dart';
import 'package:lone_number/common/colors/lone_number_colors.dart';

import '../../common/styles/lone_number_styles.dart';

class LoneNumberTextField extends StatelessWidget {
  const LoneNumberTextField(
      {super.key, required this.inputController, this.validator});
  final TextEditingController inputController;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    var loneNumberStyles = LoneNumberStyles(context);

    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 50,
          child: TextFormField(
            textAlignVertical: TextAlignVertical.bottom,
            controller: inputController,
            validator: validator,
            style: TextStyle(
              // Dodaj ten fragment do dostosowania koloru tekstu
              color: LoneNumberColors
                  .defaultGreyText, // Tutaj możesz zmienić na dowolny kolor
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: const Icon(Icons.numbers),
              iconColor: const Color(0xFF8C67F4),
              prefixIconColor: const Color(0xFF8C67F4),
              hintText: "Wpisz tablicę znaków (po przecinku)",
              hintStyle: loneNumberStyles.loneNumberInputTextStyles,
              focusedBorder: loneNumberStyles.loneNumberInputBorderStyle,
              enabledBorder: loneNumberStyles.loneNumberInputBorderStyle,
            ),
          ),
        ),
      ],
    );
  }
}
