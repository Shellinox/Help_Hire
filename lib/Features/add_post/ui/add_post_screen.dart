import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_hive/Features/add_post/bloc/add_post_bloc.dart';
import 'package:help_hive/Features/home/ui/home_screen.dart';
import 'package:help_hive/Widgets/custom_button.dart';
import 'package:help_hive/Widgets/custom_textfield.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddPostBloc addPostBloc = AddPostBloc();
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final addressController = TextEditingController();
    final salaryController = TextEditingController();
    final contactNumberController = TextEditingController();
    return BlocConsumer(
      bloc: addPostBloc,
      listenWhen: (previous, current) => current is AddPostActionState,
      buildWhen: (previous, current) => current is! AddPostActionState,
      listener: (BuildContext context, Object? state) {
        if (state is AddPostSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }
      },
      builder: (BuildContext context, state) {
        if (state is AddPostLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          children: [
            CustomTextfield(
              controller: titleController,
              hintText: 'Add title',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextfield(
              controller: descriptionController,
              hintText: 'Add Description',
              maxLines: 6,
              minLines: 5,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextfield(
              controller: addressController,
              hintText: 'Add Address',
              maxLines: 3,
              minLines: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextfield(
              controller: salaryController,
              hintText: 'Add Salary',
              keyboardType: const TextInputType.numberWithOptions(),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextfield(
              controller: contactNumberController,
              hintText: 'Add Contact number',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              buttonTitle: "Add post",
              onPressed: () {
                addPostBloc.add(
                  CreatePostButtonClickedEvent(
                      postId: FirebaseAuth.instance.currentUser!.email!,
                      title: titleController.text.trim(),
                      description: descriptionController.text.trim(),
                      address: addressController.text.trim(),
                      salary: double.parse(salaryController.text.trim()),
                      contactNum: contactNumberController.text.trim()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
