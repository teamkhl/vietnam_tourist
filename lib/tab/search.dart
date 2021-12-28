import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vietnam_tourist/widget/button_builder.dart';
import 'package:vietnam_tourist/widget/text_form_field_builder.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildSummaryPlacename(),
    );
  }

  buildSummaryPlacename() {
    // if (!loading)
    if (true) {
      // if (filteredUsers.isEmpty)
      if (false) {
        return Center(
          child: Text("No User Found",
              style: TextStyle(fontWeight: FontWeight.bold)),
        );
      } else {
        return ListView.builder(
          // itemCount: filteredUsers.length,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            // DocumentSnapshot doc = filteredUsers[index];
            // UserModel user = UserModel.fromJson(doc.data());

            // if (doc.id == currentUserId())
            // if (true) {
            //   Timer(Duration(milliseconds: 500), () {
            //     setState(() {
            //       // removeFromList(index);
            //     });
            //   });
            // }
            return Column(
              children: [
                ListTile(
                  // onTap: () => showProfile(context, profileId: user?.id),
                  contentPadding: EdgeInsets.symmetric(horizontal: 25.0),
                  leading: CircleAvatar(
                    radius: 35.0,
                    backgroundImage: NetworkImage("assets/images/rome.jpg"),
                  ),
                  title: Text("Ha Long Bay",
                      // user?.username,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("Qua dep, qua xuat sắc"
                      // user?.email,
                      ),
                  trailing: GestureDetector(
                      onTap: () {}, child: ButtonBuilder(text: "Share")),
                ),
                Divider(),
              ],
            );
          },
        );
      }
    } else {
      // return Center(
      //   child: circularProgress(context),
      // );
    }
  }
}
