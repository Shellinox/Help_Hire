import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_hive/Features/posts/bloc/post_bloc.dart';
import 'package:help_hive/Utils/colors.dart';
import 'package:help_hive/Widgets/post_tile.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final PostBloc postBloc = PostBloc();

  @override
  void initState() {
    postBloc.add(InitialPostFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: postBloc,
      listenWhen: (previous, current) => current is PostActionState,
      buildWhen: (previous, current) => current is! PostActionState,
      builder: (BuildContext context, state) {
        if (state is PostFetchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PostFetchSuccess) {
          if (state.posts.isEmpty) {
            return const Center(
              child: Text(
                "No posts yet",
                style: TextStyle(color: primaryTextColor),
              ),
            );
          }
          return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return PostTile(
                  onPressed: () {
                    postBloc.add(
                      PostDeleteButtonClickedEvent(id: post.postId),
                    );
                  },
                  title: post.title,
                  description: post.description,
                  contactNum: post.contactNum,
                  salary: post.salary,
                  address: post.address,
                );
              });
        }
        if (state is PostFetchFailure) {
          return const Center(
            child: Text(
              "Something went wrong",
              style: TextStyle(color: primaryTextColor),
            ),
          );
        }
        return const Center();
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
