import 'package:equatable/equatable.dart';

abstract class TodoListEvent extends Equatable {
  const TodoListEvent();
}

class AddTodo extends TodoListEvent {
  final String title;
  final String subtitle;

  const AddTodo({required this.title, required this.subtitle});

  @override
  List<Object?> get props => [title, subtitle];
}

class RemoveTodo extends TodoListEvent {
  final Object todo;

  const RemoveTodo({required this.todo});

  @override
  List<Object?> get props => [todo];
}
