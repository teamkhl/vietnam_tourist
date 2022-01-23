import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vietnam_tourist/providers/placename_provider.dart';
import 'package:vietnam_tourist/screens/search.dart';
import 'package:vietnam_tourist/widget/button_builder.dart';
import 'package:vietnam_tourist/widget/placename_item_builder.dart';
import 'package:vietnam_tourist/widget/text_form_field_builder.dart';

class Placenames extends StatefulWidget {
  @override
  _PlacenamesState createState() => _PlacenamesState();
}

class _PlacenamesState extends State<Placenames> {
  bool _isLoading = false;
  @override
  void initState() {
    setState(() {
      _isLoading = true;
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
    final placenameData = Provider.of<PlacenameProvider>(context);
    final fetchedPlacenames = placenameData.placenames;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey.shade200,
          title: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Search()));
            },
            child: TextFormBuilder(
                enabled: false,
                prefixIcon: Icons.search,
                hintText: "Enter placename's name..."),
          )),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: fetchedPlacenames.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    PlacenameFullItemBuilder(
                      placename: fetchedPlacenames[index],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                );
              },
            ),
    );
  }
}
