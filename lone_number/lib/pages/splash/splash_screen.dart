import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lone_number/common/styles/lone_number_styles.dart';

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
              const Gap(30),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 550,
                child: Center(
                  child: Image.asset(
                    'assets/images/splash_screen_image.png', // Popraw ścieżkę do pliku SVG
                  ),
                ),
              ),
              const Gap(30),
              Text(
                'Witaj w Lone Number',
                style: loneNumberStyles.loneNumberTitleStyle,
// Upewnij się, że ta zmienna jest zdefiniowana
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
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                child: ElevatedButton(
                  style: loneNumberStyles.loneNumberStyleButtonStyle,
                  onPressed: () => context.go('/home'),
                  child: Ink(
                    decoration:
                        loneNumberStyles.loneNumberStyleButtonContainerStyle,
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'Zacznijmy',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
