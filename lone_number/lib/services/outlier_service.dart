import '../config/models/number_list_model.dart';

class OutlierService {
  int findOutlierValue(NumberList numberList) {
    final numbers = numberList.numbers;
    List<int> values = List.from(numbers);
    int outlierValue = 0;
    if (values[0] % 2 == values[1] % 2) {
      for (int i = 2; i < values.length; i++) {
        if (values[i] % 2 != values[0] % 2) {
          outlierValue = values[i];
          break;
        }
      }
    } else {
      if (values[0] % 2 != values[2] % 2) {
        outlierValue = values[0];
      } else {
        outlierValue = values[1];
      }
    }

    return outlierValue;
  }
}
