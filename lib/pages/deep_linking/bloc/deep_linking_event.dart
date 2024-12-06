import 'package:equatable/equatable.dart';

abstract class DeepLinkingEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DeepLinkingInitial extends DeepLinkingEvent {}

class DeepLinkingFetch extends DeepLinkingEvent {}
