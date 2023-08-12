import '../config/models/number_list_model.dart';

class OutlierService {
  int findOutlierValue(NumberList numberList) {
    final numbers = numberList.numbers;
    List<int> values = List.from(numbers);

    // Find the outlier value
    int outlierValue = 0; // Initialize with a default value
    if (values[0] % 2 == values[1] % 2) {
      // If the first two numbers have the same parity, the outlier is the one with a different parity
      for (int i = 2; i < values.length; i++) {
        if (values[i] % 2 != values[0] % 2) {
          outlierValue = values[i];
          break;
        }
      }
    } else {
      // If the first two numbers have different parity, the outlier is one of them
      if (values[0] % 2 != values[2] % 2) {
        outlierValue = values[0];
      } else {
        outlierValue = values[1];
      }
    }

    return outlierValue;
  }
}
