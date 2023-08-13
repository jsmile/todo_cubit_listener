part of 'todo_filter_cubit.dart';

class TodoFilterState extends Equatable {
  final Filter filter;

  const TodoFilterState({required this.filter});

  factory TodoFilterState.initial() =>
      const TodoFilterState(filter: Filter.all);

  TodoFilterState copyWith({
    Filter? filter,
  }) {
    return TodoFilterState(
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object> get props => [filter];

  @override
  String toString() => 'TodoFilterCubitState(filter: $filter)';
}
