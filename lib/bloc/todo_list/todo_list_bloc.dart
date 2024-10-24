import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_demo/bloc/todo_list/todo_list_event.dart';
import 'package:flutter_bloc_demo/bloc/todo_list/todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {

  final List<Map<String, String>> todosList = [];

  TodoListBloc() : super(const TodoListState()) {
    on<AddTodo>(_addTodo);
    on<RemoveTodo>(_removeTodo);
  }

  void _addTodo(AddTodo event, Emitter<TodoListState> emit) {
    todosList.add({'title': event.title, 'subtitle': event.subtitle});
    emit(state.copyWith(todos: List.from(todosList)));
  }

  void _removeTodo(RemoveTodo event, Emitter<TodoListState> emit) {
    todosList.remove(event.todo);
    emit(state.copyWith(todos: List.from(todosList)));
  }
}
