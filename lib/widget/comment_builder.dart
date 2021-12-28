import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentBuilder extends StatefulWidget {
  const CommentBuilder({
    Key? key,
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
              "a day ago",
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Đẹp qfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdddddddddddddddddddddddđffffffué!",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
          Row(
            children: [
              Container(
                width: 30,
              ),
              CommentBuilder()
            ],
          ),
          Divider(),
        ]);
  }
}
