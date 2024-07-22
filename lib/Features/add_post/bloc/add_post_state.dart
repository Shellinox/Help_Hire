part of 'add_post_bloc.dart';

@immutable
sealed class AddPostState {}

sealed class AddPostActionState extends AddPostState {}

final class AddPostInitial extends AddPostState {}

final class AddPostLoading extends AddPostState {}

final class AddPostFailure extends AddPostState {
  final String errorMessage;

  AddPostFailure({
    required this.errorMessage,
  });
}

final class AddPostSuccess extends AddPostActionState {}
