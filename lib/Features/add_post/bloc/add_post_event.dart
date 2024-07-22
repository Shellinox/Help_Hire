part of 'add_post_bloc.dart';

@immutable
sealed class AddPostEvent {}

class CreatePostButtonClickedEvent extends AddPostEvent {
  final String postId;
  final String title;
  final String description;
  final String address;
  final double salary;
  final String contactNum;

  CreatePostButtonClickedEvent(
      {required this.postId,
      required this.title,
      required this.description,
      required this.address,
      required this.salary,
      required this.contactNum});
}
