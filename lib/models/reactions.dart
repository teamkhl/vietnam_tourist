// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:vietnam_tourist/models/posts.dart';

// class Reactions {

//   final DateTime date;
//   final bool status;
//   final bool like;
//   List<Account> account;
//   List<Post> post;
//   bool? done;




//  Reactions(
//    this.date, {
//      required this.status, 
//      required this.like,
//      required this.account,
//      required this.post,
//      this.done,
     
     
//      });


//   factory Reactions.fromJson(Map<String, dynamic> json) =>
//       _reactionFromJson(json);

//   Map<String, dynamic> toJson() => _reactionToJson(this);

//   @override
//   String toString() => 'Reaction<$date>';
  
// }

// Reactions _reactionFromJson(Map<String, dynamic> json) {
//   return Reactions(
//     json['date'] as String,
//     status: json['status'] as bool,
//     like: json['like'] as String,
//     account: json['account'] as Account,
//     post: json['post'] as Post,
//   );
// }

// Map<String, dynamic> _reactionToJson(Reactions instance) =>
//     <String, dynamic>{
//       'date': instance.date,
//       'status': instance.status,
//       'like': instance.like,
//       'post': instance.post,
//       'account': instance.account,
//       'done': instance.done,
//     };

