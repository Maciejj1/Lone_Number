part of 'outlier_bloc.dart';

abstract class OutlierEvent {}

class SearchEvent extends OutlierEvent {
  final NumberList numberList;

  SearchEvent(this.numberList);
}
