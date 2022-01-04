import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vietnam_tourist/widget/post/post_builder.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final postData = Provider.of<PostProvider>(context);
    final fetchedPosts = postData.posts;

    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Colors.grey.shade200,
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: fetchedPosts.length,
              itemBuilder: (context, index) =>
                  PostBuilder(post: fetchedPosts[index]),
            ));
  }
}
      // ListView(children: [
      //   Container(
      //     margin: EdgeInsets.only(right: 15, left: 15, bottom: 10),
      //     child: Text(
      //       "Top Placename",
      //       style: TextStyle(fontWeight: FontWeight.bold),
      //       textAlign: TextAlign.left,
      //     ),
      //   ),
      //   Container(
      //     margin: EdgeInsets.only(right: 15, left: 15),
      //     child: SingleChildScrollView(
      //       scrollDirection: Axis.horizontal,
      //       child: Row(
      //         children: [
      //           Container(
      //             margin: const EdgeInsets.only(right: 10),
      //             child: ImageBuilder(
      //               href: "assets/images/demo.png",
      //               height: 120,
      //               width: 100,
      //               child: GestureDetector(
      //                   onTap: () {
      //                     Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                             builder: (context) =>
      //                                 const NewPlacename()));
      //                   },
      //                   child: Container(
      //                       color: Colors.black.withOpacity(0.5),
      //                       child: Center(
      //                         child: Text(
      //                           "s",
      //                           // placenames[0]['name'],
      //                           style: TextStyle(
      //                               fontWeight: FontWeight.bold,
      //                               fontSize: 10,
      //                               color: Colors.white),
      //                         ),
      //                       ))),
      //             ),
      //           ),
      //           for (int i = 0; i < 10; i++)
      //             Container(
      //               margin: EdgeInsets.only(right: 10),
      //               height: 120,
      //               width: 100,
      //               child: ImageBuilder(
      //                 href: "assets/images/demo.png",
      //                 width: 100,
      //                 height: 120,
      //                 onTap: () => Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder: (context) => PlacenameDetail(
      //                         image: "assets/images/demo.png",
      //                         title: "Cần thơ",
      //                         latitude: "11",
      //                         longitude: "11",
      //                         description: "Đẹp lắm",
      //                         specialties: "Cái gì cũng ngon",
      //                       ),
      //                     )),
      //               ),
      //             ),
      //         ],
      //       ),
      //     ),
      //   ),
      //   for (int i = 0; i < 1; i++) PostBuilder(post: demoDB5),
      // ])
 


// FutureBuilder<List<Placename>>(
//                     future: futurePlacename,
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData) {
//                         return ListView.builder(
//                           itemCount: snapshot.data!.length,
//                           itemBuilder: (_, index) => Container(
//                             child: Container(
//                               margin: EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 5),
//                               padding: EdgeInsets.all(20.0),
//                               decoration: BoxDecoration(
//                                 color: Color(0xff97FFFF),
//                                 borderRadius: BorderRadius.circular(15.0),
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "${snapshot.data![index].name}",
//                                     style: TextStyle(
//                                       fontSize: 18.0,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(height: 10),
//                                   Text("${snapshot.data![index].description}"),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       } else {
//                         return Center(child: CircularProgressIndicator());
//                       }
//                     },
//                   ),