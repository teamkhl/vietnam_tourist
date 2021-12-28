import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vietnam_tourist/widget/button_builder.dart';
import 'package:vietnam_tourist/widget/icon_button_builder.dart';
import 'package:vietnam_tourist/widget/post/post_builder.dart';
import 'package:vietnam_tourist/widget/text_form_field_builder.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'widget/comment_builder.dart';
import 'widget/image_buider.dart';
import 'widget/post/header.dart';

// import 'package:social_media_app/auth/login/login.dart';
// import 'package:social_media_app/auth/register/register.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({Key? key}) : super(key: key);

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  Map<String, dynamic> demoDB5 = {"imgCount": 5};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vietnam tourist',
      theme: ThemeData(),
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.black),
          backgroundColor: Colors.grey.shade200,
          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.undo,
                    color: Colors.black38,
                  )),
              Container(
                child: Text(
                  "COMMENTS",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              )
            ],
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
              child: HearderPostBuilder(),
            ),
            Container(
                color: Colors.white,
                child: CarouselSlider(
                  options: CarouselOptions(height: 300.0),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            image: DecorationImage(
                              image: AssetImage("assets/images/demo.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                )),
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
                  //content
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Đẹp qfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdddddddddddddddddddddddđffffffué!",
                        style: TextStyle(fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  //post time
                  Row(
                    children: [
                      Expanded(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "a day ago",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey.shade600),
                                textAlign: TextAlign.left,
                              ))),
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
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          top: 0,
                        ),
                        child: Text(
                          "100 comments",
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
            //cmts
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     for (int x = 0; x < 5; x++) ...[CommentBuilder()]
            //   ],
            // )
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
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostDetail()),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
