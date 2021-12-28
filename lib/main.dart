import 'package:flutter/material.dart';
import 'package:vietnam_tourist/landing.dart';
import 'package:vietnam_tourist/main_screen.dart';
import 'package:vietnam_tourist/post_detail.dart';

import 'placename_details.dart';

void main() {
  runApp(const MyApp());
}

// Hãy luôn nhớ ghi chú cho từng dòng lệnh nhé !
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vietnam tourist',
      theme: ThemeData(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => Landing(),
        '/main_screen': (context) => TabScreen(),
        '/post_detail': (context) => PostDetail(),
      },
    );
  }
}
