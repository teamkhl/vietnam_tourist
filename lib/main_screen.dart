import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:vietnam_tourist/tab/feeds.dart';
import 'package:vietnam_tourist/tab/profile.dart';

import 'tab/search.dart';
import 'widget/icon_button_builder.dart';
import 'widget/text_form_field_builder.dart';
import 'widget/text_form_field_builder.dart';

List<Color> _mainColor() {
  return [Colors.blue.shade500, Colors.blue.shade700, Colors.blue.shade800];
}

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedTab = 0;
  Color _backgroundColorAppbar = Colors.grey.shade200;
  List tabs = [
    {
      'title': 'Feeds',
      'icon': Icons.home_rounded,
      'page': Feeds(),
    },
    {
      'title': 'Search',
      'icon': Icons.search_rounded,
      'page': Search(),
    },
    {
      'title': 'Notication',
      'icon': Icons.notifications,
      'page': Text(''),
    },
    {'title': 'Profile', 'icon': Icons.person, 'page': Profile()},
  ];
  List<IconData> tabIcons = [
    Icons.home_rounded,
    Icons.search_rounded,
    Icons.notifications,
    Icons.person
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedTab = index;
      if (_selectedTab != 0) {
        _backgroundColorAppbar = Colors.white;
      } else {
        _backgroundColorAppbar = Colors.grey.shade200;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Vietnam tourist',
        theme: ThemeData(),
        home: Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            elevation: 0,
            titleTextStyle: const TextStyle(color: Colors.black),
            backgroundColor: _backgroundColorAppbar,
            title: Row(
              children: [
                if (_selectedTab == 0) ...[
                  Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: Image.asset(
                        'assets/images/logo_full.png',
                        height: 15.0,
                        fit: BoxFit.cover,
                      )),
                  Expanded(
                      child: Container(
                          padding: const EdgeInsets.only(right: 15),
                          alignment: Alignment.centerRight,
                          child:
                              const IconButtonBuilder(icon: Icon(Icons.mail))))
                ] else if (_selectedTab == 1) ...[
                  // Container(
                  //   child: TextFormBuilder(
                  //       hintText: "Search",
                  //       prefixIcon: Icons.search_outlined,
                  //       suffixIcon: Icons.near_me),
                  // )
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ))
                ] else if (_selectedTab == 2)
                  ...[]
                else if (_selectedTab == 3)
                  ...[],
              ],
            ),
            actions: [
              _selectedTab == 3
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: GestureDetector(
                          onTap: () {
                            // firebaseAuth.signOut();
                            // Navigator.of(context).push(
                            //     CupertinoPageRoute(builder: (_) => Register()));
                          },
                          child: Text(
                            'Log Out',
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 15.0),
                          ),
                        ),
                      ),
                    )
                  : Text("")
            ],
          ),
          body: Center(
            child: tabs.elementAt(_selectedTab)['page'],
          ),
          bottomNavigationBar: AnimatedBottomNavigationBar(
            elevation: 0,
            icons: tabIcons,
            activeIndex: _selectedTab,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.softEdge,
            splashColor: Colors.blue.shade800,
            activeColor: Colors.blue.shade800,
            inactiveColor: Colors.grey.shade600,
            iconSize: 25,
            onTap: (index) => setState(
              () => _onItemTapped(index),
              //other params
            ),
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 1,
            splashColor: Colors.blue,
            backgroundColor: Colors.white,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return RadialGradient(
                  center: Alignment.topLeft,
                  radius: 1.0,
                  colors: _mainColor(),
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: const Icon(Icons.add),
            ),
            onPressed: () {},
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        ));
  }
}
