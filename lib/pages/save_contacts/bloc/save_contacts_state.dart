import 'package:equatable/equatable.dart';

enum SaveContactsStatus { initial, success, failure, loading }

class SaveContactsState extends Equatable {
  const SaveContactsState({
    this.status = SaveContactsStatus.initial,
  });

  final SaveContactsStatus status;

  SaveContactsState copyWith({
    SaveContactsStatus? status,
  }) {
    return SaveContactsState(
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
