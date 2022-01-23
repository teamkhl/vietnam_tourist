import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vietnam_tourist/widget/button_builder.dart';

import '/widget/post_item/header.dart';
// import 'package:image_picker/image_picker.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  Map<String, dynamic> demoDB5 = {"imgCount": 5};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        foregroundColor: Colors.black,
        actions: [ButtonBuilder(text: 'POST')],
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.black),
        backgroundColor: Colors.grey.shade200,
        title: Text(
          "Create post",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 15, left: 15),
        child: ListView(children: [
          ///author if
          HearderPostBuilder(),

          TextFormField(
            decoration: const InputDecoration(
              hintText: "What's your mind?",
              border: InputBorder.none,
            ),

            minLines: 1,
            maxLines: 10, // allow user to enter 5 line in textfield
            keyboardType: TextInputType
                .multiline, // user keyboard will have a button to move cursor to next line
            // controller: _Textcontroller,
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        color: Colors.white.withOpacity(0),
        height: 75,
        child: BottomAppBar(
            child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Row(
            children: [
              Container(
                  //show upload button after choosing image
                  child: //if uploadimage is null then show empty container
                      Container(
                child: RaisedButton.icon(
                  onPressed: () {
                    // ImagePicker().pickImage(
                    //     source:
                    //         ImageSource.gallery); // call choose image function
                  },
                  icon: Icon(Icons.folder_open),
                  label: Text("CHOOSE IMAGE"),
                  color: Colors.deepOrangeAccent,
                  colorBrightness: Brightness.dark,
                ),
              )),
            ],
          ),
        )),
      ),
    );
  }
  // Future<void> chooseImage() async {
  //       var choosedimage = await
  //       //set source: ImageSource.camera to get image from camera
  //       setState(() {
  //           uploadimage = choosedimage;
  //       });
  // }
}
