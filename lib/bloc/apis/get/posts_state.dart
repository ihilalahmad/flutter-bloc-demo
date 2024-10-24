import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/utils/enums.dart';

import '../../../model/post_model.dart';

class PostsState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postsList;
  final List<PostModel> filteredPostsList;
  final String message;
  final String filterListMessage;

  const PostsState({
    this.postStatus = PostStatus.loading,
    this.postsList = const <PostModel>[],
    this.filteredPostsList = const <PostModel>[],
    this.message = '',
    this.filterListMessage = '',
  });

  PostsState copyWith({
    PostStatus? postStatus,
    List<PostModel>? postsList,
    List<PostModel>? filteredPostsList,
    String? message,
    String? filterListMessage,
  }) {
    return PostsState(
        postsList: postsList ?? this.postsList,
        postStatus: postStatus ?? this.postStatus,
        filteredPostsList: filteredPostsList ?? this.filteredPostsList,
        message: message ?? this.message,
        filterListMessage: filterListMessage ?? this.filterListMessage);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [postsList, filteredPostsList, postStatus, message, filterListMessage];
}
