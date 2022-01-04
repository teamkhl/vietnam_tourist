import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/placename_details.dart';
import '/models/placename.dart';
import '/models/post.dart';
import '/models/user.dart';
import '/screens/post_detail.dart';
import '/providers/placename_provider.dart';
import '/providers/user_provider.dart';

import '../image_buider.dart';

List<Color> _mainColor() {
  return [Colors.blue.shade500, Colors.blue.shade700, Colors.blue.shade800];
}

class PostBuilder extends StatefulWidget {
  final Post post;

  const PostBuilder({Key? key, required this.post});
  @override
  _PostBuilderState createState() => _PostBuilderState();
}

class _PostBuilderState extends State<PostBuilder> {
  final EdgeInsets _postPadding =
      EdgeInsets.only(top: 10, bottom: 3, right: 15, left: 15);

  bool _isLoading = false;
  User fetchedUser = User();
  Placename fetchedPlacename = Placename();
  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    Provider.of<UserProvider>(context, listen: false)
        .fetchAndSetUser(widget.post.userId.toString())
        .then((value) {
      setState(() {
        fetchedUser = value;
        _isLoading = false;
      });
    });
    Provider.of<PlacenameProvider>(context, listen: false)
        .fetchAndSetPlacename(widget.post.placenameId.toString())
        .then((value) {
      setState(() {
        fetchedPlacename = value;
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: _postPadding,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            //author's info
            Container(
              padding: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 0),
              child: Row(
                children: [
                  /// avartar
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage("assets/images/demo.png"),
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(left: 20, right: 10),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: _isLoading
                                ? Text('...')
                                : Text(
                                    fetchedUser.name.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: _isLoading
                                ? Text('...')
                                : Text(
                                    widget.post.createdAt.toString(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade600),
                                    textAlign: TextAlign.left,
                                  ))
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: Divider()),
//content

            Container(
              padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.post.content.toString(),
                  style: TextStyle(),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            //show img

            if (widget.post.content != '') ...[
              // 1 images
              Image.asset("assets/images/demo.png")
            ] else if (widget.post.content == 2) ...[
              if (true) ...[
                // 2 img h
                Column(
                  children: [
                    for (int x = 0; x < 2; x++)
                      ImageBuilder(
                          href: "assets/images/demo.png",
                          height: MediaQuery.of(context).size.width / 2,
                          width: MediaQuery.of(context).size.width -
                              _postPadding.left -
                              _postPadding.right),
                  ],
                )
              ]
              // else if (v) ...[
              // 2 images v
              // Row(
              //   children: [
              //     for (int x = 0; x < 2; x++)
              //       ImageBuilder(
              //           href: "assets/images/demo.png",
              //           height: MediaQuery.of(context).size.width,
              //           width: MediaQuery.of(context).size.width / 2 -
              //               _postPadding.left),
              //   ],
              // ),
            ] else if (widget.post.content == 3) ...[
              // 3 images
              Column(
                children: [
                  for (int x = 0; x < 1; x++) ...[
                    ImageBuilder(
                        href: "assets/images/demo.png",
                        height: MediaQuery.of(context).size.width / 2,
                        width: MediaQuery.of(context).size.width -
                            _postPadding.left -
                            _postPadding.right),
                  ],
                  Row(
                    children: [
                      for (int x = 1; x < 3; x++) ...[
                        ImageBuilder(
                            href: "assets/images/demo.png",
                            height: MediaQuery.of(context).size.width / 2,
                            width: (MediaQuery.of(context).size.width -
                                    _postPadding.left -
                                    _postPadding.right) /
                                2),
                      ],
                    ],
                  )
                ],
              )
            ] else if (widget.post.content == 4) ...[
              // 4 images
              Column(
                children: [
                  Row(
                    children: [
                      for (int x = 0; x < 2; x++) ...[
                        ImageBuilder(
                            href: "assets/images/demo.png",
                            height: MediaQuery.of(context).size.width / 2,
                            width: (MediaQuery.of(context).size.width -
                                    _postPadding.left -
                                    _postPadding.right) /
                                2),
                      ],
                    ],
                  ),
                  Row(
                    children: [
                      for (int x = 2; x < 4; x++) ...[
                        ImageBuilder(
                            href: "assets/images/demo.png",
                            height: MediaQuery.of(context).size.width / 2,
                            width: (MediaQuery.of(context).size.width -
                                    _postPadding.left -
                                    _postPadding.right) /
                                2),
                      ],
                    ],
                  )
                ],
              )
            ] else if (widget.post.content == 4) ...[
              // >4 images
              Column(
                children: [
                  Row(
                    children: [
                      for (int x = 0; x < 2; x++) ...[
                        ImageBuilder(
                            href: "assets/images/demo.png",
                            height: MediaQuery.of(context).size.width / 2,
                            width: (MediaQuery.of(context).size.width -
                                    _postPadding.left -
                                    _postPadding.right) /
                                2),
                      ],
                    ],
                  ),
                  Row(
                    children: [
                      for (int x = 2; x < 3; x++) ...[
                        ImageBuilder(
                            href: "assets/images/demo.png",
                            height: MediaQuery.of(context).size.width / 2,
                            width: (MediaQuery.of(context).size.width -
                                    _postPadding.left -
                                    _postPadding.right) /
                                2),
                      ],
                      ImageBuilder(
                        href: "assets/images/demo.png",
                        height: MediaQuery.of(context).size.width / 2,
                        width: (MediaQuery.of(context).size.width -
                                _postPadding.left -
                                _postPadding.right) /
                            2,
                        child: GestureDetector(
                            onTap: () {},
                            child: Container(
                                color: Colors.black.withOpacity(0.5),
                                child: Center(
                                  child: Text(
                                    "+ " + (2 - 3).toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ))),
                      )
                    ],
                  )
                ],
              )
            ],

            //fooder post
            Container(
                padding:
                    EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const PlacenameDetail()));
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/demo.png"),
                                      fit: BoxFit.cover,
                                    ),
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(6.0),
                                        topLeft: Radius.circular(6.0)),
                                  ),
                                  alignment: FractionalOffset(0.0, 1.0),
                                ),
                                Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      //  border: Border.all(width: 4),
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(6.0),
                                          topRight: Radius.circular(6.0)),
                                    ),
                                    padding: EdgeInsets.only(
                                        right: 15, left: 15, top: 10),
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Text(
                                          _isLoading
                                              ? '...'
                                              : fetchedPlacename.name
                                                  .toString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          _isLoading
                                              ? '...'
                                              : fetchedPlacename
                                                      .coordinates['latitude']
                                                      .toString() +
                                                  " : " +
                                                  fetchedPlacename
                                                      .coordinates['longitude']
                                                      .toString(),
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    )),
                              ],
                            ))),
                    // like button
                    Container(
                      width: 80,
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.favorite,
                                color: Colors.red.shade600),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostDetail()),
                            ),
                          ),
                          //no. like
                          Padding(
                            padding: EdgeInsets.only(
                              top: 0,
                            ),
                            child: Text(
                              "100 likes",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800,
                                  fontSize: 11),
                            ),
                          )
                        ],
                      ),
                    ),
                    //cmt button
                    Container(
                      width: 80,
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.message,
                              color: Colors.grey.shade600,
                            ),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostDetail()),
                            ),
                          ),
                          //no. comt
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Text(
                              "100 comments",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800,
                                  fontSize: 11),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ));
  }
}
