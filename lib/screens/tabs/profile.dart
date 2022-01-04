import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import '/screens/edit_profile.dart';
import 'package:vietnam_tourist/services/auth.dart';
import 'package:vietnam_tourist/widget/button_builder.dart';

class Profile extends StatefulWidget {
  // In the constructor, require a Todo.
  const Profile({
    Key? key,
  }) : super(key: key);

  // Declare a field that holds the Todo.

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final storage = const FlutterSecureStorage();

  String? profile;
  Future<void> getToken() async {
    profile = (await storage.read(key: 'name'));
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
        body: Consumer<AuthcubitCubit>(builder: (context, auth, child) {
      return CustomScrollView(slivers: <Widget>[
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
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage("assets/images/demo.png"),
                        radius: 40.0,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 32.0),
                        Row(
                          children: [
                            const Visibility(
                              visible: false,
                              child: SizedBox(width: 10.0),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 130.0,
                                  child: Text(
                                    auth.user.name.toString(),
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w900),
                                    maxLines: null,
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      auth.user.birthday.toString(),
                                      style: const TextStyle(
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
                                  const Text(
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
      ]);
    })));
  }
}
