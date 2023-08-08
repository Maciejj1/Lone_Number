import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lone_number/common/theme/bloc/theme_bloc.dart';
import 'package:provider/provider.dart';
import 'bloc/outlier_bloc.dart';
import 'config/routes/routes.dart';
import 'services/outlier_service.dart';

void main() {
  final outlierService = OutlierService();
  final outlierBloc = OutlierBloc(outlierService);

  runApp(MultiProvider(
    providers: [
      BlocProvider(create: (_) => DarkModeBloc()),
      BlocProvider(create: (_) => OutlierBloc(outlierService)),
    ],
    child: MyApp(outlierBloc),
  ));
}

class MyApp extends StatelessWidget {
  final OutlierBloc outlierBloc;
  final Routes _routes = Routes();

  MyApp(this.outlierBloc, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _routes.router,
    );
  }
}
