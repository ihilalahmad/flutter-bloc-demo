import 'package:equatable/equatable.dart';

class TodoListState extends Equatable {
  final List<Map<String, String>> todoList;

  const TodoListState({this.todoList = const []});

  TodoListState copyWith({List<Map<String, String>>? todos}) {
    return TodoListState(todoList: todos ?? todoList);
  }

  @override
  List<Object?> get props => [todoList];
}
//
// [
// {'title': 'Stand up meeting ', 'subtitle': '9:15 AM'},
// {'title': 'Call to Zuraiz', 'subtitle': '10:30 AM'},
// {'title': 'Get update on Aymakan', 'subtitle': '12:00 PM'},
// {'title': 'Stable release ', 'subtitle': '12:00 PM'},
// {'title': 'Easy repost testing check ', 'subtitle': '12:00 PM'},
// {'title': 'Science news subscription issue ', 'subtitle': '12:00 PM'},
// {'title': 'Russia news iOS latest release ', 'subtitle': '12:00 PM'},
// {'title': 'Youtube channel video recording ', 'subtitle': '12:00 PM'},
// {'title': 'Schedule website post ', 'subtitle': '12:00 PM'},
// {'title': 'Submit latest update of repost ', 'subtitle': '1:30 PM'},
// ]
