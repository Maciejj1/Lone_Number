import 'package:flutter_test/flutter_test.dart';
import 'package:lone_number/config/models/number_list_model.dart';
import 'package:lone_number/services/outlier_service.dart';

void main() {
  test('Find odd outlier in a list', () {
    final outlierService = OutlierService();
    final numbers = [2, 4, 0, 100, 4, 11, 2602, 36];
    final outlier = outlierService.findOutlierValue(NumberList(numbers));
    expect(outlier, 11);
  });

  test('Find even outlier in a list', () {
    final outlierService = OutlierService();
    final numbers = [3, 7, 11, 19, 35, 51, 88, 71];
    final outlier = outlierService.findOutlierValue(NumberList(numbers));
    expect(outlier, 88);
  });
}
