import 'package:equatable/equatable.dart';

abstract class SaveContactsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SaveContactsInitial extends SaveContactsEvent {}

class SaveContactsFetch extends SaveContactsEvent {}
