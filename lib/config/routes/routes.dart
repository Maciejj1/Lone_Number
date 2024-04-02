import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:lone_number/pages/home/home_screen.dart';
import 'package:lone_number/pages/result/result_screen.dart';

import '../../pages/splash/splash_screen.dart';

class Routes {
  final GoRouter _router;
  Routes()
      : _router = GoRouter(
          routes: <RouteBase>[
            GoRoute(
              path: '/',
              builder: (BuildContext context, GoRouterState state) {
                return const SplashScreen();
              },
            ),
            GoRoute(
              path: '/home',
              builder: (BuildContext context, GoRouterState state) {
                return const HomeScreen();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'result',
                  builder: (BuildContext context, GoRouterState state) {
                    return const ResultScreen();
                  },
                ),
              ],
            ),
          ],
        );

  GoRouter get router => _router;
}
