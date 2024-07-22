part of 'post_bloc.dart';

@immutable
sealed class PostState {}

sealed class PostActionState extends PostState {}

final class PostInitial extends PostState {}

final class PostFetchSuccess extends PostState {
  final List<PostModel> posts;

  PostFetchSuccess({required this.posts});
}

final class PostFetchFailure extends PostState {
  final String errorMessage;
  PostFetchFailure(
    this.errorMessage,
  );
}

final class PostFetchLoading extends PostState {}


final class PostDeleteFailure extends PostState {
  final String errorMessage;

  PostDeleteFailure(this.errorMessage);
}
