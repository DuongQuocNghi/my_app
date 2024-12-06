import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/commons/supports/throttle_droppable.dart';
import 'package:my_app/pages/deep_linking/bloc/deep_linking_event.dart';
import 'package:my_app/pages/deep_linking/bloc/deep_linking_state.dart';


class DeepLinkingBloc extends Bloc<DeepLinkingEvent, DeepLinkingState> {
  DeepLinkingBloc() : super(const DeepLinkingState()) {
    on<DeepLinkingInitial>(
      _onDeepLinkingInitial,
      transformer: throttleDroppable(throttleDuration),
    );
    on<DeepLinkingFetch>(
      _onDeepLinkingFetched,
      transformer: throttleDroppable(throttleDuration),
    );

  }

  Future<void> _onDeepLinkingInitial(
      DeepLinkingInitial event,
      Emitter<DeepLinkingState> emit,
      ) async {
    try {
      // final data = await _fetchDeepLinkings(id: '');
      return emit(state.copyWith(
          status: DeepLinkingStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(status: DeepLinkingStatus.failure));
    }
  }

  Future<void> _onDeepLinkingFetched(
      DeepLinkingFetch event,
      Emitter<DeepLinkingState> emit,
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
      emit(state.copyWith(status: DeepLinkingStatus.failure));
    }
  }
}