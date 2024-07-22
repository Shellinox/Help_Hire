import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:help_hive/Features/posts/models/post_model.dart';

class PostRepository {
  static Future<List<PostModel>> fetchPosts() async {
    try {
      FirebaseFirestore db = FirebaseFirestore.instance;
      final List<PostModel> posts = [];
      final CollectionReference collection = db.collection("Posts");
      final QuerySnapshot querySnapshot = await collection.get();
      final documents = querySnapshot.docs;
      for (var document in documents) {
        final post = PostModel.fromMap(
            document.data() as Map<String, dynamic>, document.id);
        posts.add(post);
      }
      return posts;
    } catch (error) {
      return [];
    }
  }

  static deletePost(String postId) async {
    try {
      FirebaseFirestore db = FirebaseFirestore.instance;
      await db.collection("Posts").doc(postId).delete();
    } catch (e) {
      return e.toString();
    }
  }
}
