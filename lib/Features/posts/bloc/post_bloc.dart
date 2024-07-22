import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:help_hive/Features/posts/models/post_model.dart';
import 'package:help_hive/Features/posts/repository/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<InitialPostFetchEvent>(initialPostFetchEvent);
    on<PostDeleteButtonClickedEvent>(postDeleteButtonClickedEvent);
  }

  FutureOr<void> initialPostFetchEvent(
      InitialPostFetchEvent event, Emitter<PostState> emit) async {
    try {
      List<PostModel> posts = await PostRepository.fetchPosts();
      return emit(
        PostFetchSuccess(posts: posts),
      );
    } catch (error) {
      return emit(
        PostFetchFailure(
          error.toString(),
        ),
      );
    }
  }

  postDeleteButtonClickedEvent(
      PostDeleteButtonClickedEvent event, Emitter<PostState> emit) async {
    try {
      PostRepository.deletePost(event.id);
      return emit(
        PostFetchSuccess(posts: await PostRepository.fetchPosts()),
      );
    } catch (error) {
      return emit(
        PostDeleteFailure(
          error.toString(),
        ),
      );
    }
  }
}
