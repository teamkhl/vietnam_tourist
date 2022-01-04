import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vietnam_tourist/providers/placename_provider.dart';
import 'package:vietnam_tourist/widget/button_builder.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
    return ChangeNotifierProvider(
        create: (ctx) => PlacenameProvider(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'so',
            home: Scaffold(
              body: buildSummaryPlacename(),
            )));
  }

  buildSummaryPlacename() {
    final placenameData = Provider.of<PlacenameProvider>(context);
    final fetchedPlacenames = placenameData.placenames;
    return ListView.builder(
      itemCount: fetchedPlacenames.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            ListTile(
              // onTap: () => showProfile(context, profileId: user?.id),
              contentPadding: EdgeInsets.symmetric(horizontal: 25.0),
              leading: CircleAvatar(
                radius: 35.0,
                backgroundImage: NetworkImage("assets/images/demo.png"),
              ),
              title: Text(fetchedPlacenames[index].name.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(fetchedPlacenames[index].description.toString()),
              trailing: GestureDetector(
                  onTap: () {},
                  child: ButtonBuilder(
                    text: "Share",
                    width: 80,
                  )),
            ),
            Divider(),
          ],
        );
      },
    );
  }
}
