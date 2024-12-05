import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/commons/supports/throttle_droppable.dart';
import 'package:my_app/pages/change_language/bloc/change_language_event.dart';
import 'package:my_app/pages/change_language/bloc/change_language_state.dart';


class ChangeLanguageBloc extends Bloc<ChangeLanguageEvent, ChangeLanguageState> {
  ChangeLanguageBloc() : super(const ChangeLanguageState()) {
    on<ChangeLanguageInitial>(
      _onChangeLanguageInitial,
      transformer: throttleDroppable(throttleDuration),
    );
    on<ChangeLanguageFetch>(
      _onChangeLanguageFetched,
      transformer: throttleDroppable(throttleDuration),
    );

  }

  Future<void> _onChangeLanguageInitial(
      ChangeLanguageInitial event,
      Emitter<ChangeLanguageState> emit,
      ) async {
    try {
      // final data = await _fetchChangeLanguages(id: '');
      return emit(state.copyWith(
          status: ChangeLanguageStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(status: ChangeLanguageStatus.failure));
    }
  }

  Future<void> _onChangeLanguageFetched(
      ChangeLanguageFetch event,
      Emitter<ChangeLanguageState> emit,
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
      emit(state.copyWith(status: ChangeLanguageStatus.failure));
    }
  }
}