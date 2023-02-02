import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final String datePublished;
  final List postUrl;
  final List profImage;
  final likes;

  const Post({
    required this.description,
    required this.uid,
    required this.username,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
    required this.likes,
  });

  static get snap => null;

  Map<String, dynamic> toJson() => {
        "description": description,
        "uid": uid,
        "username": username,
        "postId": postId,
        "datePublisher": datePublished,
        "profImage": profImage,
        "likes": likes,
        "postUrl":postId,
      };

  static Post fromSnap(DocumentSnapshot snapshot) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
      username: snapshot['username'],
      uid: snapshot['uid'],
      description: snapshot['description'],
      datePublished: snapshot['datepublished'],
      profImage: snapshot['profImage'],
      likes: snapshot['likes'],
      postId: snapshot['postId'],
        postUrl: snapshot['postUrl'],
    );
  }
}
