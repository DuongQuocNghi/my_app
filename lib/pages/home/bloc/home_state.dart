import 'package:equatable/equatable.dart';

enum HomeStatus { initial, success, failure, loading }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    // List load more
    // this.total = 0,
    // this.hasNextPage = true,
    // this.page = 1,
  });

  final HomeStatus status;
  // List load more
  // final int total;
  // final bool hasNextPage;
  // final int page;

  HomeState copyWith({
    HomeStatus? status,
    // List load more
    // int? total,
    // bool? hasNextPage,
    // int? page,
  }) {
    return HomeState(
      status: status ?? this.status,
      // List load more
      // total: total ?? this.total,
      // hasNextPage: hasNextPage ?? this.hasNextPage,
      // page: page ?? this.page,
    );
  }

  @override
  String toString() {
    return '';
  }

  // props nếu không khai báo đầy đủ các biến thì khi emit các biến bị thiếu sẽ ko dc cập nhật data
  @override
  List<Object?> get props => [status]; // , total, hasNextPage, page]; List load more
}
