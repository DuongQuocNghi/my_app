import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/commons/supports/throttle_droppable.dart';
import 'package:my_app/pages/save_contacts/bloc/save_contacts_event.dart';
import 'package:my_app/pages/save_contacts/bloc/save_contacts_state.dart';

class SaveContactsBloc extends Bloc<SaveContactsEvent, SaveContactsState> {
  SaveContactsBloc() : super(const SaveContactsState()) {
    on<SaveContactsInitial>(
      _onSaveContactsInitial,
      transformer: throttleDroppable(throttleDuration),
    );
    on<SaveContactsFetch>(
      _onSaveContactsFetched,
      transformer: throttleDroppable(throttleDuration),
    );

  }

  Future<void> _onSaveContactsInitial(
      SaveContactsInitial event,
      Emitter<SaveContactsState> emit,
      ) async {
    try {
      // final data = await _fetchSaveContactss(id: '');
      return emit(state.copyWith(
          status: SaveContactsStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(status: SaveContactsStatus.failure));
    }
  }

  Future<void> _onSaveContactsFetched(
      SaveContactsFetch event,
      Emitter<SaveContactsState> emit,
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
      emit(state.copyWith(status: SaveContactsStatus.failure));
    }
  }
}