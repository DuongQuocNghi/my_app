import 'package:equatable/equatable.dart';

enum QRCodeStatus { initial, success, failure, loading }

class QRCodeState extends Equatable {
  const QRCodeState({
    this.status = QRCodeStatus.initial,
  });

  final QRCodeStatus status;

  QRCodeState copyWith({
    QRCodeStatus? status,
  }) {
    return QRCodeState(
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
