import 'package:equatable/equatable.dart';

abstract class BarcodeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class BarcodeInitial extends BarcodeEvent {}

class BarcodeFetch extends BarcodeEvent {}
