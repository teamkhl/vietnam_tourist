// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:vietnam_tourist/models/posts.dart';

// class Images {

//   final String path;
//   final String description;
//   final bool status;
//   List<Post> post;
//   bool? done;

//  Images(
//    this.path, {
//      required this.description, 
//      required this.status,
//      required this.post,
//      this.done,
     
     
//      });


//   factory Images.fromJson(Map<String, dynamic> json) =>
//       _imageFromJson(json);

//   Map<String, dynamic> toJson() => _imageToJson(this);

//   @override
//   String toString() => 'Image<$path>';
  
// }

// Images _imageFromJson(Map<String, dynamic> json) {
//   return Images(
//     json['path'] as String,
//     status: json['status'] as bool,
//     description: json['description'] as String,
//     post: json['post'] as Post,
//   );
// }

// Map<String, dynamic> _imageToJson(Images instance) =>
//     <String, dynamic>{
//       'path': instance.path,
//       'description': instance.description,
//       'status': instance.status,
//       'post': instance.post,
//       'done': instance.done,
//     };

