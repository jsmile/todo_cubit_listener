import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/cubits.dart';

import 'pages/todos_page/todos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoFilterCubit>(
          create: (context) => TodoFilterCubit(),
        ),
        BlocProvider<TodoSearchCubit>(
          create: (context) => TodoSearchCubit(),
        ),
        BlocProvider<TodoListCubit>(
          create: (context) => TodoListCubit(),
        ),
        BlocProvider<ActiveTodoCountCubit>(
          create: (context) => ActiveTodoCountCubit(
            initialActiveTodoCount:
                context.read<TodoListCubit>().state.todos.length,
          ),
        ),
        BlocProvider<FilteredTodosCubit>(
          create: (context) => FilteredTodosCubit(
            initialFilteredTodos: context.read<TodoListCubit>().state.todos,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'TODO',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const TodosPage(),
      ),
    );
  }
}
