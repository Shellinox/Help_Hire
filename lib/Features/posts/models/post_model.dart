import 'dart:convert';

class PostModel {
  final String postId;
  final String title;
  final String description;
  final String address;
  final double salary;
  final String contactNum;

  PostModel({
    required this.postId,
    required this.title,
    required this.description,
    required this.address,
    required this.salary,
    required this.contactNum,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'postId': postId,
      'title': title,
      'description': description,
      'address': address,
      'salary': salary,
      'contactNum': contactNum,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map, String id) {
    return PostModel(
      postId: id,
      title: map['title'] as String,
      description: map['description'] as String,
      address: map['address'] as String,
      salary: map['salary'] as double,
      contactNum: map['contactNum'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}
