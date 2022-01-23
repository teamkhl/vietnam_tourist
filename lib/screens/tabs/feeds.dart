import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vietnam_tourist/models/placename.dart';
import 'package:vietnam_tourist/providers/placename_picture_provider.dart';
import 'package:vietnam_tourist/providers/placename_provider.dart';
import 'package:vietnam_tourist/widget/icon_button_builder.dart';
import 'package:vietnam_tourist/widget/image_buider.dart';
import 'package:vietnam_tourist/widget/placename_item_builder.dart';
import 'package:vietnam_tourist/widget/post_item/post_item_builder.dart';
import '../new_placename.dart';
import '../placename_details.dart';
import '../search.dart';
import '/providers/post_provider.dart';

// import 'package:social_media_app/auth/login/login.dart';
// import 'package:social_media_app/auth/register/register.dart';

class Feeds extends StatefulWidget {
  const Feeds({Key? key}) : super(key: key);

  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  bool _isLoading = false;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    Provider.of<PostProvider>(context, listen: false)
        .fetchAndSetPosts()
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    Provider.of<PlacenameProvider>(context, listen: false)
        .fetchAndSetPlacenames()
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final postData = Provider.of<PostProvider>(context);
    final fetchedPosts = postData.posts;
    final placenameData = Provider.of<PlacenameProvider>(context);
    final fetchedPlacenames = placenameData.placenames;

    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Colors.grey.shade200,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Row(children: [
                Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: Image.asset(
                      'assets/images/logo_full.png',
                      height: 15.0,
                      fit: BoxFit.cover,
                    )),
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.only(right: 15),
                        alignment: Alignment.centerRight,
                        child: IconButtonBuilder(
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Search()),
                                ),
                            icon: Icon(Icons.search))))
              ]),
              backgroundColor: Colors.grey.shade200,
            ),
            body: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 15, left: 15, bottom: 10),
                  child: Text(
                    "Top Placename",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(right: 15, left: 15),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          ...(fetchedPlacenames).map((e) => Row(
                                children: [
                                  PlacenameItemBuilder(placename: e),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ))
                        ]))),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: fetchedPosts.length,
                  itemBuilder: (context, index) =>
                      PostItemBuilder(post: fetchedPosts[index]),
                )
              ],
            ));
  }
}
