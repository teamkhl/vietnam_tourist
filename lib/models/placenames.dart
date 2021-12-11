import 'dart:html';
import 'dart:ui';
import 'Comments.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class placenames{
  String name;
  String longitude;
  String latitude;
  String description;
  String specialties;
  String? referenceId;

  List<Comments> Comments;
  List<Images> Image;
  List<Reactions> Reaction;
  List<Posts>Post;

 placenames(
   this.name,
   {
    this.longitude,
   this.latitude,
   this.description,
   this.specialties,
   this.referenceId,
   required this.Comments,
   required this.Image,
   required this.Reaction,
   required this.Post
   });
  factory placenames.fromSnapshot(DocumentSnapshot snapshot) {
    final newplacenames = placenames.fromJson(snapshot.data() as Map<String, dynamic>);
    newplacenames.referenceId = snapshot.reference.id;
    return newplacenames;
  }

  factory placenames.fromJson(Map<String, dynamic> json) => _placenamesFromJson(json);

  Map<String, dynamic> toJson() => _placenamesToJson(this);

  @override
  String toString() => 'placenames<$name>';
}

placenames _placenamesFromJson(Map<String, dynamic> json) {
  return placenames(json['name'] as String,
      longitude: json['longitude'] as String,
      latitude: json['latitude'] as String,
      description: json['description'] as String,
      specialties: json['specialties'] as String,
      referenceId: json['referenceId'] as String,
      Comments:
          _convertComments(json['Comments'] as List<dynamic>));
         
}

List<Comments> _convertComments(List<dynamic> CommentsMap) {
  final Comments = <Comment>[];

  for (final Comments in CommentsMap) {
   Comments.add(Comments.fromJson(Comments as Map<String, dynamic>));
  }
  return Comments;
}
List<Image> _convertImage(List<dynamic> ImageMap) {
  final Images = <Image>[];

  for (final Image in ImageMap) {
   Image.add(Image.fromJson(Image as Map<String, dynamic>));
  }
  return Images;
}
List<Reaction> _convertReaction(List<dynamic> ReactionMap) {
  final Reaction = <Reaction>[];

  for (final Reaction in ReactionMap) {
   Reaction.add(Reaction.fromJson(Reaction as Map<String, dynamic>));
  }
  return Reaction;
}
List<Post> _convertPost(List<dynamic> PostMap) {
  final Post = <Post>[];

  for (final Post in PostMap) {
   Post.add(Post.fromJson(Post as Map<String, dynamic>));
  }
  return Post;
}
Map<String, dynamic> _placenamesToJson(placenames instance) => <String, dynamic>{
      'name': instance.name,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'description': instance.description,
      'specialties': instance.specialties,
      'referenceId': instance.referenceId,
      'comments': _commentList(instance.Comments),
      'Image': _commentList(instance.Image),
      'Reaction': _commentList(instance.Reaction),
      'Post': _commentList(instance.Post),
    };

List<Map<String, dynamic>>? _commentList(List<Comments>? comments) {
  if (comments == null) {
    return null;
  }
  final commentsMap = <Map<String, dynamic>>[];
  comments.forEach((comment) {
    commentsMap.add(comment.toJson());
  });
  return commentsMap;
}
List<Map<String, dynamic>>? _ImageList(List<Image>? Image) {
  if (Image == null) {
    return null;
  }
  final ImageMap = <Map<String, dynamic>>[];
  Image.forEach((Image) {
    ImageMap.add(Image.toJson());
  });
  return ImageMap;
}
List<Map<String, dynamic>>? _ReactiontList(List<Reaction>? Reaction) {
  if (Reaction == null) {
    return null;
  }
  final ReactionMap = <Map<String, dynamic>>[];
  Reaction.forEach((Reaction) {
    ReactionMap.add(Reaction.toJson());
  });
  return ReactionMap;
}
List<Map<String, dynamic>>? _PostList(List<Post>? Post) {
  if (Post == null) {
    return null;
  }
  final PostMap = <Map<String, dynamic>>[];
  Post.forEach((Post) {
    PostMap.add(Post.toJson());
  });
  return PostMap;
}