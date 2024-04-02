import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lone_number/common/styles/lone_number_styles.dart';
import 'package:lone_number/pages/widgets/lone_number_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoneNumberStyles loneNumberStyles = LoneNumberStyles(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(0),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 450,
                child: Center(
                  child: Image.asset(
                    'assets/images/splash_screen_image.png',
                  ),
                ),
              ),
              const Gap(30),
              Text(
                'Witaj w Lone Number',
                style: loneNumberStyles.loneNumberTitleStyle,
              ),
              const Gap(30),
              const SizedBox(
                width: 250,
                child: Text(
                  'Zacznijmy obliczać',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Gap(30),
              LoneNumberButton(
                  buttonMethod: () => context.go('/home'),
                  buttonText: 'Zacznijmy'),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
