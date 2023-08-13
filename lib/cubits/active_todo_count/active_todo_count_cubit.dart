import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'active_todo_count_state.dart';

// todoListSubscription 에 관한 것들을 모두 지우고
// activeTodoCount 를 param으로 전달받아 State 설정을 할 수 있도록 준비해야 함.
class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  // 초기 TODO List count 반영 시 사용
  final int initialActiveTodoCount;

  ActiveTodoCountCubit({
    required this.initialActiveTodoCount,
  }) : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCount));

  // activeTodoCount 를 param으로 전달받아 State 설정준비
  void setActiveTodoCount(int activeTodoCount) {
    emit(state.copyWith(activeTodoCount: activeTodoCount));
  }
}
