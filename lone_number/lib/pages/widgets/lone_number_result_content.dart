import 'package:flutter/material.dart';
import 'package:lone_number/common/colors/lone_number_colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../common/styles/lone_number_styles.dart';

class ResultWidget extends StatefulWidget {
  final int result;

  const ResultWidget(this.result, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ResultWidgetState createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loneNumberStyles = LoneNumberStyles(context);

    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Opacity(
            opacity: _fadeInAnimation.value,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientText(
                    '${widget.result}',
                    style: loneNumberStyles.loneNumberResultTextStyles,
                    colors: [
                      LoneNumberColors.gradientOneColor,
                      LoneNumberColors.gradientSecondColor
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
