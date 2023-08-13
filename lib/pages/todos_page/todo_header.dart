import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit_listener/cubits/cubits.dart';

import '../../models/todo_model.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'TODO',
          style: TextStyle(
            fontSize: 40.0,
          ),
        ),
        BlocListener<TodoListCubit, TodoListState>(
          listener: (context, state) {
            // TodoListState의 active 상태의 갯수를 구해서
            final int activeTodoCount = state.todos
                .where((Todo todo) => !todo.completed)
                .toList()
                .length;
            // ActiveTodoCountCubit의 state를 변경한다.
            context
                .read<ActiveTodoCountCubit>()
                .setActiveTodoCount(activeTodoCount);
          },
          child: BlocBuilder<ActiveTodoCountCubit, ActiveTodoCountState>(
            builder: (context, state) {
              return Text(
                '${state.activeTodoCount} items left',
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 20.0,
                ),
              );
            },
          ),
        ),
        // Text(
        //   '${context.watch<ActiveTodoCountCubit>().state.activeTodoCount} items left',
        //   style: const TextStyle(
        //     color: Colors.green,
        //     fontSize: 20.0,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
      ],
    );
  }
}
