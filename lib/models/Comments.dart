import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vietnam_tourist/models/placenames.dart';

class Comments{
AccountId accountID;
placeNameId placeNameId;
String content;
 DateTime date;
Comments(this.accountID,
{
  required this.date,
  this.content,
  this.placeNameId
});
factory Comments.fromJson(Map<String,dynamic> json)=> _CommentsFromJson(json);


  Map<String, dynamic> toJson() => _CommentsToJson(this);

  @override
  String toString() => 'Comments<$accountID>';
}

Comments _CommentsFromJson(Map<String, dynamic> json) {
  return Comments(json['accountID'] as String,
      placeNameId: json['placeNameId'] as placenames?,
      content: json['content'] as String,
      date: json['date'] as DateTime,
      );
         
}
Map<String, dynamic> _CommentsToJson(Comments instance) => <String, dynamic>{
      'accountID': instance.accountID,
      'placeNameId': instance.placeNameId,
      'content': instance.content,
      'date': instance.date,
    };