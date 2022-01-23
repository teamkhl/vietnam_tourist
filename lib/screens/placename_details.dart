import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vietnam_tourist/models/image.dart';
import 'package:vietnam_tourist/models/placename.dart';
import 'package:vietnam_tourist/providers/placename_picture_provider.dart';
import 'package:vietnam_tourist/providers/server_url.dart';
import 'package:vietnam_tourist/widget/button_builder.dart';
import 'package:vietnam_tourist/widget/text_form_field_builder.dart';
import 'package:vietnam_tourist/widget/comment_builder.dart';

class PlacenameDetail extends StatefulWidget {
  const PlacenameDetail({Key? key, required this.placename}) : super(key: key);
  final Placename placename;

  @override
  _PlacenameDetailState createState() => _PlacenameDetailState();
}

class _PlacenameDetailState extends State<PlacenameDetail> {
  Container bottomInfo() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Text(
            "DESCRIPTION",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            widget.placename.description.toString(),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            textAlign: TextAlign.left,
          ),
          Text(
            "SPECIALTIES",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            widget.placename.specialties.toString(),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Container topInfo() {
    return Container(
        //  padding: EdgeInsets.only(left: 20,right: 20,top: 12,bottom: 12),
        child: Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                size: 16,
                color: Colors.grey,
              ),
              Text(widget.placename.coordinates['latitude'].toString(),
                  style: TextStyle(color: Colors.grey, fontSize: 13)),
              Text(widget.placename.coordinates['longitude'].toString(),
                  style: TextStyle(color: Colors.grey, fontSize: 13))
            ],
          ),
        )
      ],
    ));
  }

  bool _isLoading = false;
  List<Picture> fetchedPlacenamePicture = [];
  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });

    Provider.of<PlacenamePictureProvider>(context, listen: false)
        .fetchAndSetPlacenamePictures(widget.placename.id.toString())
        .then((value) {
      setState(() {
        fetchedPlacenamePicture = value;
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [ButtonBuilder(text: 'GO')],
          foregroundColor: Colors.black,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.black),
          backgroundColor: Colors.grey.shade200,
          title: Row(
            children: [
              Container(
                child: Text(
                  widget.placename.name.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
        body: ListView(
          children: [
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
                              image: NetworkImage(serverUrl() +
                                  fetchedPlacenamePicture
                                      .firstWhere((element) => true,
                                          orElse: () => Picture())
                                      .path
                                      .toString()),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                )),
            topInfo(),
            bottomInfo(),
            // con 1 cai cmt
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
                    onPressed: () => {}),
                IconButton(
                    icon: Icon(Icons.share, color: Colors.blue.shade600),
                    onPressed: () => {}),
              ],
            ),
          )),
        ));
  }
}
