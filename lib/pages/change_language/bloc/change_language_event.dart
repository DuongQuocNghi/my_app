import 'package:equatable/equatable.dart';

abstract class ChangeLanguageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeLanguageInitial extends ChangeLanguageEvent {}

class ChangeLanguageFetch extends ChangeLanguageEvent {}
