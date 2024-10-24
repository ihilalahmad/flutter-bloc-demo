import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/apis/get/posts_bloc.dart';
import 'package:flutter_bloc_demo/bloc/apis/get/posts_event.dart';
import 'package:flutter_bloc_demo/bloc/apis/get/posts_state.dart';
import 'package:flutter_bloc_demo/utils/enums.dart';

class GetApiScreen extends StatefulWidget {
  const GetApiScreen({super.key});

  @override
  State<GetApiScreen> createState() => _GetApiScreenState();
}

class _GetApiScreenState extends State<GetApiScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostsBloc>().add(FetchPosts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Get Posts'),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PostStatus.success:
              if (state.postsList.isEmpty) {
                return const Center(
                  child: Text('Uh oh, looks like there are no posts'),
                );
              } else {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Search', border: OutlineInputBorder()),
                        onChanged: (filterKey) {
                          context.read<PostsBloc>().add(FilterPostsList(searchQuery: filterKey));
                        },
                      ),
                    ),
                    Expanded(
                      child: state.filterListMessage.isNotEmpty ? Center(child: Text(state.filterListMessage.toString()),): ListView.builder(
                        itemCount: state.filteredPostsList.isEmpty ? state.postsList.length : state.filteredPostsList.length,
                        itemBuilder: (context, index) {
                          final item = state.filteredPostsList.isEmpty ?  state.postsList[index] : state.filteredPostsList[index];
                          return Card(
                            child: ListTile(
                              title: Text(
                                item.email.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                item.body.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
            case PostStatus.failure:
              return Center(
                child: Text(state.message),
              );
          }
        },
      ),
    );
  }
}
