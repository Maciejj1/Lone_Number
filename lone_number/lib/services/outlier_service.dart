import '../config/models/number_list_model.dart';

class OutlierService {
  int findOutlier(NumberList numberList) {
    final numbers = numberList.numbers;
    int evenCount = 0;
    int oddCount = 0;
    int outlierValue = numbers[0]; // Initialize with the first number

    for (var number in numbers) {
      if (number % 2 == 0) {
        evenCount++;
        outlierValue = number;
      } else {
        oddCount++;
        outlierValue = number;
      }

      if (evenCount > 1 && oddCount == 1) {
        break; // Found the outlier
      }

      if (oddCount > 1 && evenCount == 1) {
        break; // Found the outlier
      }
    }

    return outlierValue;
  }
}
