import 'package:equatable/equatable.dart';

abstract class QRCodeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class QRCodeInitial extends QRCodeEvent {}

class QRCodeFetch extends QRCodeEvent {}
