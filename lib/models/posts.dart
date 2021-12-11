import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:vietnam_tourist/models/images.dart';
class Post {
  Account account;
  Placename placeName;
  bool beVisited;
  DateTime date;
  String content;
  List<image> images;
  List<reaction> reactions;
  List<comment> comments;
  String? referenceId;
  Post(this.account,
      {this.placeName,
      required this.content,
      required this.beVisited,
      required this.date,
      required this.images,
      required this.reactions,
      required this.comments});

  factory Post.fromSnapshot(DocumentSnapshot snapshot) {
    final newPost = Post.fromJson(snapshot.data() as Map<String, dynamic>);
    newPost.referenceId = snapshot.reference.id;
    return newPost;
  }

  factory Post.fromJson(Map<String, dynamic> json) => _postFromJson(json);

  Map<String, dynamic> toJson() => _postToJson(this);

  @override
  String toString() => 'Post<$account>';
}

Post _postFromJson(Map<String, dynamic> json) {
  return Post(
      json['account'] as Account,
      placeName: json['placeName'] as Placename?,
      beVisited: json['type'] as bool,
      date: json['date'] as DateTime?,
      content: json['content'] as String,
      images:
          _convertimages(json['images'] as List<dynamic>),
      reactions:
          _convertreactions(json['reactions'] as List<dynamic>),
      comments:
          _convertcomments(json['comments'] as List<dynamic>));
}

List<Images> _convertimages(List<dynamic> imageMap) {
  final image = <Images>[];

  for (final image in imageMap) {
    images.add(Images.fromJson(images as Map<String, dynamic>));
  }
  return images;
}
List<Reactions> _convertreactions(List<dynamic> reactionMap) {
  final reactions = <>[];

  for (final reaction in reactionMap) {
    ractions.add(Reactions.fromJson(reactions as Map<String, dynamic>));
  }
  return reactions;
}
List<Comments> _convertComments(List<dynamic> commentMap) {
  final comments = <Comments>[];

  for (final comments in commentMap) {
    comments.add(Comments.fromJson(Comments as Map<String, dynamic>));
  }
  return comments;
}


Map<String, dynamic> _postToJson(Post instance) => <String, dynamic>{
      'account': instance.account,
      'placeName': instance.placeName,
      'beVisited': instance.beVisited,
      'date': instance.date,
      'content': instance.content,
      'images': _imageList(instance.images),
      'reactions': _reactionList(instance.reactions),
      'comments': _commentList(instance.comments),

   
    };

List<Map<String, dynamic>>? _imageList(List<Images>? images) {
  if (image == null) {
    return null;
  }
  final imageMap = <Map<String, dynamic>>[];
  images.forEach((image) {
    imageMap.add(image.Json());
  });
  return imageMap;
}
List<Map<String, dynamic>>? _vaccinationList(List<Reaction>? reactions) {
  if (reactions == null) {
    return null;
  }
  final reactionMap = <Map<String, dynamic>>[];
  reactions.forEach((reactions) {
    reactionMap.add(reaction.toJson());
  });
  return reactionMap;
}

List<Map<String, dynamic>>? _commentList(List<Comment>? comments) {
  if (comments == null) {
    return null;
  }
  final commentMap = <Map<String, dynamic>>[];
  comments.forEach((comment) {
    commentMap.add(comment.toJson());
  });
  return commentMap;
}

