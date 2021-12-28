import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vietnam_tourist/widget/image_buider.dart';
import 'package:vietnam_tourist/widget/post/post_builder.dart';

import '../new_placename.dart';
import '../placename_details.dart';

// import 'package:social_media_app/auth/login/login.dart';
// import 'package:social_media_app/auth/register/register.dart';

class Feeds extends StatefulWidget {
  const Feeds({Key? key}) : super(key: key);

  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  Map<String, dynamic> demoDB0 = {"imgCount": 0};
  Map<String, dynamic> demoDB1 = {"imgCount": 1};
  Map<String, dynamic> demoDB2 = {"imgCount": 2};
  Map<String, dynamic> demoDB3 = {"imgCount": 3};
  Map<String, dynamic> demoDB4 = {"imgCount": 4};
  Map<String, dynamic> demoDB5 = {"imgCount": 12};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: ListView(children: [
          Container(
            margin: EdgeInsets.only(right: 15, left: 15, bottom: 10),
            child: Text(
              "Placename Top",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 15, left: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: ImageBuilder(
                      href: "assets/images/demo.png",
                      height: 120,
                      width: 100,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewPlacename()));
                          },
                          child: Container(
                              color: Colors.black.withOpacity(0.5),
                              child: Center(
                                child: Text(
                                  "New Placename",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.white),
                                ),
                              ))),
                    ),
                  ),
                  for (int i = 0; i < 10; i++)
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 120,
                      width: 100,
                      child: ImageBuilder(
                        href: "assets/images/demo.png",
                        width: 100,
                        height: 120,
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlacenameDetail(
                                image: "assets/images/demo.png",
                                title: "Cần thơ",
                                latitude: "11",
                                longitude: "11",
                                description: "Đẹp lắm",
                                specialties: "Cái gì cũng ngon",
                              ),
                            )),
                      ),
                    ),
                ],
              ),
            ),
          ),
          for (int i = 0; i < 1; i++) PostBuilder(post: demoDB5),
          for (int i = 0; i < 1; i++) PostBuilder(post: demoDB4),
          for (int i = 0; i < 1; i++) PostBuilder(post: demoDB3),
          for (int i = 0; i < 1; i++) PostBuilder(post: demoDB2),
          for (int i = 0; i < 1; i++) PostBuilder(post: demoDB1),
          for (int i = 0; i < 1; i++) PostBuilder(post: demoDB0),
        ]));
  }
}
