import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vietnam_tourist/models/image.dart';
import 'package:vietnam_tourist/providers/placename_picture_provider.dart';
import 'package:vietnam_tourist/providers/server_url.dart';
import 'package:vietnam_tourist/screens/placename_details.dart';
import 'package:vietnam_tourist/widget/button_builder.dart';
import '/models/placename.dart';

class PlacenameItemBuilder extends StatefulWidget {
  final Placename placename;

  const PlacenameItemBuilder({
    Key? key,
    required this.placename,
  });
  @override
  _PlacenameItemBuilderState createState() => _PlacenameItemBuilderState();
}

class _PlacenameItemBuilderState extends State<PlacenameItemBuilder> {
  List<Picture> fetchedPlacenamePicture = [];
  bool _isLoading = false;
  @override
  void initState() {
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
    return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            '/placenamedetail',
            arguments: widget.placename,
          );
        },
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(serverUrl() +
                      fetchedPlacenamePicture
                          .firstWhere((element) => true,
                              orElse: () => Picture())
                          .path
                          .toString()),
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
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  //  border: Border.all(width: 4),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6.0),
                      topRight: Radius.circular(6.0)),
                ),
                padding: EdgeInsets.only(right: 15, left: 15, top: 10),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      widget.placename.name.toString(),
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.placename.coordinates['latitude'].toString() +
                          " : " +
                          widget.placename.coordinates['longitude'].toString(),
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
          ],
        ));
  }
}

class PlacenameFullItemBuilder extends StatefulWidget {
  final Placename placename;

  const PlacenameFullItemBuilder({Key? key, required this.placename});
  @override
  _PlacenameItemFullBuilderState createState() =>
      _PlacenameItemFullBuilderState();
}

class _PlacenameItemFullBuilderState extends State<PlacenameFullItemBuilder> {
  List<Picture> fetchedPlacenamePicture = [];
  bool _isLoading = false;
  @override
  void initState() {
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
    return Container(
        padding: EdgeInsets.only(right: 15, left: 15),
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PlacenameDetail(placename: widget.placename)));
            },
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width / 3 - 15,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(serverUrl() +
                          fetchedPlacenamePicture
                              .firstWhere((element) => true,
                                  orElse: () => Picture())
                              .path
                              .toString()),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(6.0),
                        topLeft: Radius.circular(6.0)),
                  ),
                  alignment: Alignment.center,
                ),
                Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width / 3 * 2 - 15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //  border: Border.all(width: 4),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(6.0),
                          topRight: Radius.circular(6.0)),
                    ),
                    padding: EdgeInsets.only(right: 15, left: 15, top: 10),
                    alignment: Alignment.centerLeft,
                    child: Row(children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              widget.placename.name.toString(),
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                widget.placename.coordinates['latitude']
                                        .toString() +
                                    " : " +
                                    widget.placename.coordinates['longitude']
                                        .toString(),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.left),
                            SizedBox(
                              height: 5,
                            ),
                            Text(widget.placename.description.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.left)
                          ],
                        ),
                      ),
                      ButtonBuilder(text: 'Share')
                    ])),
              ],
            )));
  }
}
