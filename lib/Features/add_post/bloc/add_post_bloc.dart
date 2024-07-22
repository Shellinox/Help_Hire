import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:help_hive/Features/posts/models/post_model.dart';
part 'add_post_event.dart';
part 'add_post_state.dart';

class AddPostBloc extends Bloc<AddPostEvent, AddPostState> {
  final db = FirebaseFirestore.instance;
  AddPostBloc() : super(AddPostInitial()) {
    on<CreatePostButtonClickedEvent>(createPostButtonClickedEvent);
  }

  createPostButtonClickedEvent(
      CreatePostButtonClickedEvent event, Emitter<AddPostState> emit) async {
    emit(AddPostLoading());

    try {
      final post = PostModel(
        postId: event.postId,
        title: event.title,
        description: event.description,
        address: event.address,
        salary: event.salary,
        contactNum: event.contactNum,
      );

      await db.collection("Posts").add(post.toMap()).then((val) {
        return emit(AddPostSuccess());
      });
    } catch (e) {
      return emit(
        AddPostFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
