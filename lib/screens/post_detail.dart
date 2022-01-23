import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vietnam_tourist/models/comment.dart';
import 'package:vietnam_tourist/models/placename.dart';
import 'package:vietnam_tourist/models/post.dart';
import 'package:vietnam_tourist/models/image.dart';
import 'package:vietnam_tourist/models/user.dart';
import 'package:vietnam_tourist/providers/placename_picture_provider.dart';
import 'package:vietnam_tourist/providers/placename_provider.dart';
import 'package:vietnam_tourist/providers/post_comment.dart';
import 'package:vietnam_tourist/providers/post_image_provider.dart';
import 'package:vietnam_tourist/providers/server_url.dart';
import 'package:vietnam_tourist/providers/user_provider.dart';
import 'package:vietnam_tourist/widget/comment_builder.dart';
import 'package:vietnam_tourist/widget/placename_item_builder.dart';
import 'package:vietnam_tourist/widget/text_form_field_builder.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PostDetail extends StatefulWidget {
  final Post post;

  const PostDetail({
    Key? key,
    required this.post,
  });

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  bool _isLoading = false;
  User fetchedUser = User();
  Placename fetchedPlacename = Placename();
  List<Picture> fetchedPostPicture = [];
  List<Comment> fetchedPostComment = [];
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

    Provider.of<PostPictureProvider>(context, listen: false)
        .fetchAndSetPostPictures(widget.post.id.toString())
        .then((value) {
      setState(() {
        fetchedPostPicture = value;
        _isLoading = false;
      });
    });
    Provider.of<PostCommentProvider>(context, listen: false)
        .fetchAndSetPostComments(widget.post.id.toString())
        .then((value) {
      setState(() {
        fetchedPostComment = value;
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => PlacenamePictureProvider(),
          )
        ],
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            foregroundColor: Colors.black,
            elevation: 0,
            titleTextStyle: TextStyle(color: Colors.black),
            backgroundColor: Colors.grey.shade200,
            title: Text(
              "COMMENTS",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          body: ListView(
            children: [
              ///author if
              Container(
                margin: EdgeInsets.only(right: 20, left: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6.0),
                      topRight: Radius.circular(6.0)),
                  color: Colors.white,
                ),
                child:

                    ///author if
                    Container(
                        padding: EdgeInsets.only(
                            right: 10, left: 10, top: 10, bottom: 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                /// avartar
                                CircleAvatar(
                                  radius: 22,
                                  backgroundImage: NetworkImage(serverUrl() +
                                      fetchedUser.avatar.toString()),
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
                                          child: Text(
                                            fetchedUser.name.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
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
                            Padding(
                                padding: EdgeInsets.only(right: 10, left: 10),
                                child: Divider()),
                            Container(
                              padding: EdgeInsets.only(
                                  right: 10, left: 10, bottom: 10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.post.content.toString(),
                                  style: TextStyle(),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ],
                        )),
              ),
              fetchedPostPicture.length == 0
                  ? Container()
                  : Container(
                      color: Colors.white,
                      child: CarouselSlider.builder(
                          itemCount: fetchedPostPicture.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                              Builder(builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    image: DecorationImage(
                                      image: NetworkImage(serverUrl() +
                                          fetchedPostPicture[itemIndex]
                                              .path
                                              .toString()),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }),
                          options: CarouselOptions(height: 300.0)),
                    ),
              Container(
                margin: EdgeInsets.only(right: 20, left: 20),
                padding: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(6.0),
                      bottomRight: Radius.circular(6.0)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    //post time
                    Row(
                      children: [
                        Expanded(
                            child: PlacenameItemBuilder(
                          placename: fetchedPlacename,
                        )),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 0,
                          ),
                          child: Text(
                            "100 favorite",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800,
                                fontSize: 11),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            top: 0,
                          ),
                          child: Text(
                            fetchedPostComment.length.toString() + " comment",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800,
                                fontSize: 11),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              // cmts
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (fetchedPostComment.length == 0) ...[
                    Align(
                        alignment: Alignment.center,
                        child: Text("No comment still!"))
                  ] else ...[
                    ...(fetchedPostComment).map(
                      (e) => CommentBuilder(comment: e),
                    ),
                  ]
                ],
              )
            ],
          ),
          bottomNavigationBar: Container(
            color: Colors.white.withOpacity(0),
            height: 75,
            child: BottomAppBar(
                child: Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormBuilder(
                      hintText: "What's your mind?",
                      suffixIcon: Icons.send,
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.favorite, color: Colors.red.shade600),
                      onPressed: () {}),
                ],
              ),
            )),
          ),
        ));
  }
}
