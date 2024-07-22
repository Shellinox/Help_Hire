part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

class InitialPostFetchEvent extends PostEvent {}

class PostDeleteButtonClickedEvent extends PostEvent {
  final String id;

  PostDeleteButtonClickedEvent({
    required this.id,
  });
}
