import 'package:flutter/material.dart';
import 'package:vietnam_tourist/edit_profile.dart';
import 'package:vietnam_tourist/widget/button_builder.dart';

class Profile extends StatefulWidget {
  final name;

  Profile({this.name});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          pinned: true,
          floating: false,
          toolbarHeight: 5.0,
          collapsedHeight: 6.0,
          expandedHeight: 220.0,
          flexibleSpace: FlexibleSpaceBar(
              background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("assets/images/logo.jpg"),
                      radius: 40.0,
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 32.0),
                      Row(
                        children: [
                          Visibility(
                            visible: false,
                            child: SizedBox(width: 10.0),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 130.0,
                                child: Text(
                                  'VietNam',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w900),
                                  maxLines: null,
                                ),
                              ),
                              Container(
                                width: 130.0,
                                child: Text(
                                  'HaLong',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'user?.email',
                                    style: TextStyle(
                                      // color: Color(0xff4D4D4D),
                                      fontSize: 10.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {},
                            child: Column(
                              children: [
                                Icon(Icons.settings,
                                    color: Theme.of(context).accentColor),
                                Text(
                                  'settings',
                                  style: TextStyle(fontSize: 11.5),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [Text('0'), Text('POSTS')],
                    ),
                    Column(
                      children: [Text('0'), Text('FOLLOWERS')],
                    ),
                    Column(
                      children: [Text('0'), Text('FOLLOWING')],
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                ButtonBuilder(
                  width: 100,
                  text: "Edit Profile",
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()),
                  ),
                )
              ]))),
    ])));
  }
}
