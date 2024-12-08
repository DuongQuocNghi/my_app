import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/commons/supports/throttle_droppable.dart';
import 'package:my_app/pages/barcode/bloc/barcode_event.dart';
import 'package:my_app/pages/barcode/bloc/barcode_state.dart';

class BarcodeBloc extends Bloc<BarcodeEvent, BarcodeState> {
  BarcodeBloc() : super(const BarcodeState()) {
    on<BarcodeInitial>(
      _onBarcodeInitial,
      transformer: throttleDroppable(throttleDuration),
    );
    on<BarcodeFetch>(
      _onBarcodeFetched,
      transformer: throttleDroppable(throttleDuration),
    );

  }

  Future<void> _onBarcodeInitial(
      BarcodeInitial event,
      Emitter<BarcodeState> emit,
      ) async {
    try {
      // final data = await _fetchBarcodes(id: '');
      return emit(state.copyWith(
          status: BarcodeStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(status: BarcodeStatus.failure));
    }
  }

  Future<void> _onBarcodeFetched(
      BarcodeFetch event,
      Emitter<BarcodeState> emit,
      ) async {
    // if (!state.hasNextPage) return;
    try {
      // final data = await _fetchProjectLists(
      //   page: state.page+1,
      //   search: state.search,
      //   inputdata: state.dataFilter.getInputDataFilterGetListRealEstateProjects(),
      //   sort: state.sort,
      // );
      // return emit(state.copyWith(
      //     status: ProjectListStatus.success,
      //     projectLists: List.of(state.projectLists)..addAll(data.items ?? []),
      //     total: data.total,
      //     hasNextPage: data.hasNextPage,
      //     page: data.page
      // ));
    } catch (_) {
      emit(state.copyWith(status: BarcodeStatus.failure));
    }
  }
}