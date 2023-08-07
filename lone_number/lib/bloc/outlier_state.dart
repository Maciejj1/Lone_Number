part of 'outlier_bloc.dart';

@immutable
abstract class OutlierState extends Equatable {
  const OutlierState();

  @override
  List<Object?> get props => [];
}

class OutlierInitial extends OutlierState {}

class OutlierLoading extends OutlierState {}

class OutlierSuccess extends OutlierState {
  final int result;

  const OutlierSuccess(this.result);

  @override
  List<Object?> get props => [result];
}
