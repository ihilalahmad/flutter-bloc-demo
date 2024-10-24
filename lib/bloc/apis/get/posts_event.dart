import 'package:equatable/equatable.dart';

abstract class PostsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchPosts extends PostsEvent {}

class FilterPostsList extends PostsEvent {
  final String searchQuery;

  FilterPostsList({required this.searchQuery});
}
