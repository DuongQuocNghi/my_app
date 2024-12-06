import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/commons/supports/throttle_droppable.dart';
import 'package:my_app/pages/change_theme/bloc/change_theme_event.dart';
import 'package:my_app/pages/change_theme/bloc/change_theme_state.dart';


class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
  ChangeThemeBloc() : super(const ChangeThemeState()) {
    on<ChangeThemeInitial>(
      _onChangeThemeInitial,
      transformer: throttleDroppable(throttleDuration),
    );
    on<ChangeThemeFetch>(
      _onChangeThemeFetched,
      transformer: throttleDroppable(throttleDuration),
    );

  }

  Future<void> _onChangeThemeInitial(
      ChangeThemeInitial event,
      Emitter<ChangeThemeState> emit,
      ) async {
    try {
      // final data = await _fetchChangeThemes(id: '');
      return emit(state.copyWith(
          status: ChangeThemeStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(status: ChangeThemeStatus.failure));
    }
  }

  Future<void> _onChangeThemeFetched(
      ChangeThemeFetch event,
      Emitter<ChangeThemeState> emit,
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
      emit(state.copyWith(status: ChangeThemeStatus.failure));
    }
  }
}