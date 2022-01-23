import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vietnam_tourist/models/comment.dart';

class CommentBuilder extends StatefulWidget {
  final Comment comment;

  const CommentBuilder({
    Key? key,
    required this.comment,
  });
  @override
  _CommentBuilderState createState() => _CommentBuilderState();
}

class _CommentBuilderState extends State<CommentBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //author if
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
            leading: CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage("assets/images/demo.png"),
            ),
            title: Text(
              "Nguyen Van Khoa",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            subtitle: Text(
              widget.comment.createdAt.toString(),
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              widget.comment.content.toString(),
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
          ),

          Divider(),
        ]);
  }
}
