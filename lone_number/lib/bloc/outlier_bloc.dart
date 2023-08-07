import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../config/models/number_list_model.dart';
import '../services/outlier_service.dart';

part 'outlier_event.dart';
part 'outlier_state.dart';

class OutlierBloc extends Bloc<OutlierEvent, OutlierState> {
  final OutlierService outlierService;

  OutlierBloc(this.outlierService) : super(OutlierInitial()) {
    on<SearchEvent>((event, emit) {
      final result = outlierService.findOutlier(event.numberList);
      emit(OutlierSuccess(result));
    });
  }
}
