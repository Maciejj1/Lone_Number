import '../config/models/number_list_model.dart';

class OutlierService {
  int findOutlier(NumberList numberList) {
    final oddNumbers = numberList.numbers.where((number) => number % 2 != 0);
    final evenNumbers = numberList.numbers.where((number) => number % 2 == 0);

    if (oddNumbers.length == 1) {
      return oddNumbers.first;
    } else {
      return evenNumbers.first;
    }
  }
}
