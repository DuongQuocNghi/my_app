import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/commons/supports/throttle_droppable.dart';
import 'package:my_app/pages/demo/bloc/demo_event.dart';
import 'package:my_app/pages/demo/bloc/demo_state.dart';


class DemoBloc extends Bloc<DemoEvent, DemoState> {
  DemoBloc() : super(const DemoState()) {
    on<DemoInitial>(
      _onDemoInitial,
      transformer: throttleDroppable(throttleDuration),
    );
    on<DemoFetch>(
      _onDemoFetched,
      transformer: throttleDroppable(throttleDuration),
    );

  }

  Future<void> _onDemoInitial(
      DemoInitial event,
      Emitter<DemoState> emit,
      ) async {
    try {
      // final data = await _fetchDemos(id: '');
      return emit(state.copyWith(
          status: DemoStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(status: DemoStatus.failure));
    }
  }

  Future<void> _onDemoFetched(
      DemoFetch event,
      Emitter<DemoState> emit,
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
      emit(state.copyWith(status: DemoStatus.failure));
    }
  }
}