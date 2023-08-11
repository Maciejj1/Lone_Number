import '../config/models/number_list_model.dart';

class OutlierService {
  int findOutlier(NumberList numberList) {
    final numbers = numberList.numbers;
    final median = _calculateMedian(numbers);

    num maxDeviation = 0;
    var outlierValue = numbers[0]; // Initialize with the first number

    for (var number in numbers) {
      final deviation = (number - median).abs();
      if (deviation > maxDeviation) {
        maxDeviation = deviation;
        outlierValue = number;
      }
    }

    return outlierValue;
  }

  num _calculateMedian(List<int> numbers) {
    final sortedNumbers = [...numbers]..sort();
    final n = sortedNumbers.length;

    if (n % 2 == 1) {
      return sortedNumbers[n ~/ 2].toInt();
    } else {
      final mid = n ~/ 2;
      return (sortedNumbers[mid - 1] + sortedNumbers[mid]) / 2.0;
    }
  }
}
