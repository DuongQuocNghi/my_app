import 'package:equatable/equatable.dart';

enum ChangeThemeStatus { initial, success, failure, loading }

class ChangeThemeState extends Equatable {
  const ChangeThemeState({
    this.status = ChangeThemeStatus.initial,
  });

  final ChangeThemeStatus status;

  ChangeThemeState copyWith({
    ChangeThemeStatus? status,
  }) {
    return ChangeThemeState(
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
