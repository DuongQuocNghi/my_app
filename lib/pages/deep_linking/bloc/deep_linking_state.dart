import 'package:equatable/equatable.dart';

enum DeepLinkingStatus { initial, success, failure, loading }

class DeepLinkingState extends Equatable {
  const DeepLinkingState({
    this.status = DeepLinkingStatus.initial,
  });

  final DeepLinkingStatus status;

  DeepLinkingState copyWith({
    DeepLinkingStatus? status,
  }) {
    return DeepLinkingState(
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
