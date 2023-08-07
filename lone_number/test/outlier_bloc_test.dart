import 'package:flutter_test/flutter_test.dart';
import 'package:lone_number/bloc/outlier_bloc.dart';
import 'package:lone_number/config/models/number_list_model.dart';
import 'package:lone_number/services/outlier_service.dart';

void main() {
  test('OutlierBloc emits correct ResultState', () {
    final outlierService = OutlierService();
    final outlierBloc = OutlierBloc(outlierService);

    final numbers = NumberList([2, 4, 0, 100, 4, 11, 2602, 36]);
    outlierBloc.add(SearchEvent(numbers));

    expectLater(
      outlierBloc.stream,
      emits(isA<OutlierSuccess>().having((state) => state.result, 'value', 11)),
    );

    outlierBloc.close();
  });
}
