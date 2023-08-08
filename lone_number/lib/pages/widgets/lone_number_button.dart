import 'package:flutter/material.dart';

import '../../common/styles/lone_number_styles.dart';

class LoneNumberButton extends StatelessWidget {
  const LoneNumberButton(
      {super.key, required this.buttonMethod, required this.buttonText});
  final Function buttonMethod;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    var loneNumberStyles = LoneNumberStyles(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: ElevatedButton(
        style: loneNumberStyles.loneNumberStyleButtonStyle,
        onPressed: () => buttonMethod(),
        child: Ink(
          decoration: loneNumberStyles.loneNumberStyleButtonContainerStyle,
          child: Container(
            width: double.infinity,
            height: 50,
            alignment: Alignment.center,
            child: Text(
              buttonText,
              style: loneNumberStyles.loneNumberButtonText,
            ),
          ),
        ),
      ),
    );
  }
}
