import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/commons/supports/throttle_droppable.dart';
import 'package:my_app/pages/qr_code/bloc/qr_code_event.dart';
import 'package:my_app/pages/qr_code/bloc/qr_code_state.dart';


class QRCodeBloc extends Bloc<QRCodeEvent, QRCodeState> {
  QRCodeBloc() : super(const QRCodeState()) {
    on<QRCodeInitial>(
      _onQRCodeInitial,
      transformer: throttleDroppable(throttleDuration),
    );
    on<QRCodeFetch>(
      _onQRCodeFetched,
      transformer: throttleDroppable(throttleDuration),
    );

  }

  Future<void> _onQRCodeInitial(
      QRCodeInitial event,
      Emitter<QRCodeState> emit,
      ) async {
    try {
      // final data = await _fetchQRCodes(id: '');
      return emit(state.copyWith(
          status: QRCodeStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(status: QRCodeStatus.failure));
    }
  }

  Future<void> _onQRCodeFetched(
      QRCodeFetch event,
      Emitter<QRCodeState> emit,
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
      emit(state.copyWith(status: QRCodeStatus.failure));
    }
  }
}