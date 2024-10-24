import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/todo_list/todo_list_bloc.dart';
import 'package:flutter_bloc_demo/bloc/todo_list/todo_list_event.dart';
import 'package:flutter_bloc_demo/bloc/todo_list/todo_list_state.dart';

const List<Map<String, String>> todoList = [
  {'title': 'Stand up meeting ', 'subtitle': '9:15 AM'},
  {'title': 'Call to Zuraiz', 'subtitle': '10:30 AM'},
  {'title': 'Get update on Aymakan', 'subtitle': '12:00 PM'},
  {'title': 'Stable release ', 'subtitle': '12:00 PM'},
  {'title': 'Easy repost testing check ', 'subtitle': '12:00 PM'},
  {'title': 'Science news subscription issue ', 'subtitle': '12:00 PM'},
  {'title': 'Russia news iOS latest release ', 'subtitle': '12:00 PM'},
  {'title': 'Youtube channel video recording ', 'subtitle': '12:00 PM'},
  {'title': 'Schedule website post ', 'subtitle': '12:00 PM'},
  {'title': 'Submit latest update of repost ', 'subtitle': '1:30 PM'},
];

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Todo List'),
      ),
      body: BlocBuilder<TodoListBloc, TodoListState>(
        builder: (context, state) {
          if (state.todoList.isEmpty) {
            return const Center(
              child: Text('No Todos found'),
            );
          } else {
            return ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todoList[index]['title'].toString()),
                  subtitle: Text(state.todoList[index]['subtitle'].toString()),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_rounded),
                    onPressed: () {
                      context
                          .read<TodoListBloc>()
                          .add(RemoveTodo(todo: state.todoList[index]));
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 10; i++) {
            context.read<TodoListBloc>().add(
                AddTodo(title: 'My todo  $i', subtitle: 'My todo subtitle $i'));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
