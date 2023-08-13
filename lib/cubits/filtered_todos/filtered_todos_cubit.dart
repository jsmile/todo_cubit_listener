import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/todo_model.dart';

part 'filtered_todos_state.dart';

// 관련된 subscription 을 모두 지우고
// 필요한 항목들을 param 으로 전달받아 State 설정을 할 수 있도록 준비해야 함.
class FilteredTodosCubit extends Cubit<FilteredTodosState> {
  final List<Todo> initialFilteredTodos;

  FilteredTodosCubit({
    required this.initialFilteredTodos,
  }) : super(FilteredTodosState(filteredTodos: initialFilteredTodos));

  // FilteredTodosState 를 param 으로 전달받아 State 설정준비
  void setFilteredTodos(Filter filter, List<Todo> todos, String searchTerm) {
    List<Todo> filteredTodos;

    // 먼저 현재의 Filter 상태를 반영한 Todo List 를 구하고,
    switch (filter) {
      case Filter.active:
        filteredTodos = todos.where((Todo todo) => !todo.completed).toList();
        break;

      case Filter.completed:
        filteredTodos = todos.where((Todo todo) => todo.completed).toList();
        break;

      case Filter.all:
      default:
        filteredTodos = todos;
        break;
    }

    // 현재의 Filter 상태에서 검색어를 반영한 Todo List 를 구한 뒤,
    if (searchTerm.isNotEmpty) {
      filteredTodos = filteredTodos
          .where((Todo todo) =>
              todo.desc.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    }

    // Filtered Todos State 를 업데이트 한다.
    emit(state.copyWith(filteredTodos: filteredTodos));
  }
}
