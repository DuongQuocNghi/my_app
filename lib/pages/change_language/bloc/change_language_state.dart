import 'package:equatable/equatable.dart';

enum ChangeLanguageStatus { initial, success, failure, loading }

class ChangeLanguageState extends Equatable {
  const ChangeLanguageState({
    this.status = ChangeLanguageStatus.initial,
  });

  final ChangeLanguageStatus status;

  ChangeLanguageState copyWith({
    ChangeLanguageStatus? status,
  }) {
    return ChangeLanguageState(
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
