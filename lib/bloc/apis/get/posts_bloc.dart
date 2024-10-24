import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_demo/bloc/apis/get/posts_event.dart';
import 'package:flutter_bloc_demo/bloc/apis/get/posts_state.dart';
import 'package:flutter_bloc_demo/utils/enums.dart';

import '../../../model/post_model.dart';
import '../../../repository/post_repository.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostRepository postRepository;
  List<PostModel> filteredPostsList = [];

  PostsBloc(this.postRepository) : super(const PostsState()) {
    on<FetchPosts>(_fetchPosts);
    on<FilterPostsList>(_filterPostsList);
  }

  void _fetchPosts(FetchPosts event, Emitter<PostsState> emit) async {
    await postRepository.fetchPosts().then((value) {
      emit(
        state.copyWith(postStatus: PostStatus.success, postsList: value),
      );
    }).onError((error, stackTrace) {
      emit(
        state.copyWith(
          message: error.toString(),
          postStatus: PostStatus.failure,
        ),
      );
    });
  }

  void _filterPostsList(FilterPostsList event, Emitter<PostsState> emit) {
    if (event.searchQuery.isEmpty) {
      emit(state.copyWith(filteredPostsList: [], filterListMessage: ''));
    } else {
      filteredPostsList = state.postsList
          .where((element) =>
              element.email.toString().toLowerCase().contains(event.searchQuery.toString().toLowerCase()))
          .toList();
      if (filteredPostsList.isEmpty) {
        emit(state.copyWith(filterListMessage: 'No result found'));
      } else {
        emit(state.copyWith(filteredPostsList: filteredPostsList, filterListMessage: ''));
      }
    }
  }
}
