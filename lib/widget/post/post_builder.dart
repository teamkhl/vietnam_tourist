// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:vietnam_tourist/post_detail.dart';

// import '../image_buider.dart';

// List<Color> _mainColor() {
//   return [Colors.blue.shade500, Colors.blue.shade700, Colors.blue.shade800];
// }

// class PostBuilder extends StatefulWidget {
//   final Map<String, dynamic> post;

//   const PostBuilder({Key? key, required this.post});
//   @override
//   _PostBuilderState createState() => _PostBuilderState();
// }

// class _PostBuilderState extends State<PostBuilder> {
//   final EdgeInsets _postPadding =
//       EdgeInsets.only(top: 10, bottom: 3, right: 15, left: 15);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: _postPadding,
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(6.0)),
//           color: Colors.white,
//         ),
//         child: Column(
//           children: [
//             //author's info
//             Container(
//               padding:
//                   EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
//               child: Row(
//                 children: [
//                   /// avartar
//                   CircleAvatar(
//                     radius: 22,
//                     backgroundImage: AssetImage("assets/images/demo.png"),
//                   ),
//                   Expanded(
//                       child: Container(
//                     padding: EdgeInsets.only(left: 20, right: 10),
//                     child: Column(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.only(bottom: 5),
//                           child: Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Nguyen Van Khoa",
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                               textAlign: TextAlign.left,
//                             ),
//                           ),
//                         ),
//                         Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Can Tho, Viet Nam",
//                               style: TextStyle(
//                                   fontSize: 12, color: Colors.grey.shade600),
//                               textAlign: TextAlign.left,
//                             ))
//                       ],
//                     ),
//                   )),
//                 ],
//               ),
//             ),
//             //show img

//             if (widget.post['imgCount'] == 1) ...[
//               // 1 images
//               Image.asset("assets/images/demo.png")
//             ] else if (widget.post['imgCount'] == 2) ...[
//               if (true) ...[
//                 // 2 img h
//                 Column(
//                   children: [
//                     for (int x = 0; x < 2; x++)
//                       ImageBuilder(
//                           href: "assets/images/demo.png",
//                           height: MediaQuery.of(context).size.width / 2,
//                           width: MediaQuery.of(context).size.width -
//                               _postPadding.left -
//                               _postPadding.right),
//                   ],
//                 )
//               ]
//               // else if (v) ...[
//               // 2 images v
//               // Row(
//               //   children: [
//               //     for (int x = 0; x < 2; x++)
//               //       ImageBuilder(
//               //           href: "assets/images/demo.png",
//               //           height: MediaQuery.of(context).size.width,
//               //           width: MediaQuery.of(context).size.width / 2 -
//               //               _postPadding.left),
//               //   ],
//               // ),
//             ] else if (widget.post['imgCount'] == 3) ...[
//               // 3 images
//               Column(
//                 children: [
//                   for (int x = 0; x < 1; x++) ...[
//                     ImageBuilder(
//                         href: "assets/images/demo.png",
//                         height: MediaQuery.of(context).size.width / 2,
//                         width: MediaQuery.of(context).size.width -
//                             _postPadding.left -
//                             _postPadding.right),
//                   ],
//                   Row(
//                     children: [
//                       for (int x = 1; x < 3; x++) ...[
//                         ImageBuilder(
//                             href: "assets/images/demo.png",
//                             height: MediaQuery.of(context).size.width / 2,
//                             width: (MediaQuery.of(context).size.width -
//                                     _postPadding.left -
//                                     _postPadding.right) /
//                                 2),
//                       ],
//                     ],
//                   )
//                 ],
//               )
//             ] else if (widget.post['imgCount'] == 4) ...[
//               // 4 images
//               Column(
//                 children: [
//                   Row(
//                     children: [
//                       for (int x = 0; x < 2; x++) ...[
//                         ImageBuilder(
//                             href: "assets/images/demo.png",
//                             height: MediaQuery.of(context).size.width / 2,
//                             width: (MediaQuery.of(context).size.width -
//                                     _postPadding.left -
//                                     _postPadding.right) /
//                                 2),
//                       ],
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       for (int x = 2; x < 4; x++) ...[
//                         ImageBuilder(
//                             href: "assets/images/demo.png",
//                             height: MediaQuery.of(context).size.width / 2,
//                             width: (MediaQuery.of(context).size.width -
//                                     _postPadding.left -
//                                     _postPadding.right) /
//                                 2),
//                       ],
//                     ],
//                   )
//                 ],
//               )
//             ] else if (widget.post['imgCount'] > 4) ...[
//               // 4 images
//               Column(
//                 children: [
//                   Row(
//                     children: [
//                       for (int x = 0; x < 2; x++) ...[
//                         ImageBuilder(
//                             href: "assets/images/demo.png",
//                             height: MediaQuery.of(context).size.width / 2,
//                             width: (MediaQuery.of(context).size.width -
//                                     _postPadding.left -
//                                     _postPadding.right) /
//                                 2),
//                       ],
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       for (int x = 2; x < 3; x++) ...[
//                         ImageBuilder(
//                             href: "assets/images/demo.png",
//                             height: MediaQuery.of(context).size.width / 2,
//                             width: (MediaQuery.of(context).size.width -
//                                     _postPadding.left -
//                                     _postPadding.right) /
//                                 2),
//                       ],
//                       ImageBuilder(
//                         href: "assets/images/demo.png",
//                         height: MediaQuery.of(context).size.width / 2,
//                         width: (MediaQuery.of(context).size.width -
//                                 _postPadding.left -
//                                 _postPadding.right) /
//                             2,
//                         child: GestureDetector(
//                             onTap: () {},
//                             child: Container(
//                                 color: Colors.black.withOpacity(0.5),
//                                 child: Center(
//                                   child: Text(
//                                     "+ " +
//                                         (widget.post['imgCount'] - 3)
//                                             .toString(),
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 20,
//                                         color: Colors.white),
//                                   ),
//                                 ))),
//                       )
//                     ],
//                   )
//                 ],
//               )
//             ],

//             //fooder post
//             Container(
//                 padding:
//                     EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         children: [
//                           //content
//                           Container(
//                             padding: EdgeInsets.only(bottom: 5),
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 "Nắng mưa làng...",
//                                 style: TextStyle(),
//                                 textAlign: TextAlign.left,
//                               ),
//                             ),
//                           ),
//                           //post time
//                           Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 "a day ago",
//                                 style: TextStyle(
//                                     fontSize: 12, color: Colors.grey.shade600),
//                                 textAlign: TextAlign.left,
//                               ))
//                         ],
//                       ),
//                     ),
//                     // like button
//                     Container(
//                       width: 80,
//                       child: Column(
//                         children: [
//                           IconButton(
//                             icon: Icon(Icons.favorite,
//                                 color: Colors.red.shade600),
//                             onPressed: () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => PostDetail()),
//                             ),
//                           ),
//                           //no. like
//                           Padding(
//                             padding: EdgeInsets.only(
//                               top: 0,
//                             ),
//                             child: Text(
//                               "100 likes",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.grey.shade800,
//                                   fontSize: 11),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     //cmt button
//                     Container(
//                       width: 80,
//                       child: Column(
//                         children: [
//                           IconButton(
//                             icon: Icon(
//                               Icons.message,
//                               color: Colors.grey.shade600,
//                             ),
//                             onPressed: () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => PostDetail()),
//                             ),
//                           ),
//                           //no. comt
//                           Padding(
//                             padding: EdgeInsets.only(top: 0),
//                             child: Text(
//                               "100 comments",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.grey.shade800,
//                                   fontSize: 11),
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 )),
//           ],
//         ));
//   }
// }
