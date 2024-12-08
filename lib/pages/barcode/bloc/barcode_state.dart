import 'package:equatable/equatable.dart';

enum BarcodeStatus { initial, success, failure, loading }

class BarcodeState extends Equatable {
  const BarcodeState({
    this.status = BarcodeStatus.initial,
  });

  final BarcodeStatus status;

  BarcodeState copyWith({
    BarcodeStatus? status,
  }) {
    return BarcodeState(
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return '';
  }

  // props nếu không khai báo đầy đủ các biến thì khi emit các biến bị thiếu sẽ ko dc cập nhật data
  @override
  List<Object?> get props => [status];
}
