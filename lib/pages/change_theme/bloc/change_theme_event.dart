import 'package:equatable/equatable.dart';

abstract class ChangeThemeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeThemeInitial extends ChangeThemeEvent {}

class ChangeThemeFetch extends ChangeThemeEvent {}
