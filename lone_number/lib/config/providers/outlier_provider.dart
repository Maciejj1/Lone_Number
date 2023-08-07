import 'package:flutter/material.dart';

class OutlierProvider extends ChangeNotifier {
  int? _outlier;

  int? get outlier => _outlier;

  set outlier(int? value) {
    _outlier = value;
    notifyListeners();
  }
}
