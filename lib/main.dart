import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'dart:async';
import 'dart:collection';
=======
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:vietnam_tourist/providers/placename_picture_provider.dart';
import 'package:vietnam_tourist/providers/placename_provider.dart';
import 'package:vietnam_tourist/providers/post_image_provider.dart';
import 'package:vietnam_tourist/providers/post_provider.dart';
import 'package:vietnam_tourist/providers/user_provider.dart';
import 'package:vietnam_tourist/route_generator.dart';
import '/screens/landing.dart';
import '/screens/main_screen.dart';
import '/screens/post_detail.dart';
import 'providers/post_comment.dart';
import 'screens/search.dart';
import 'services/auth.dart';
>>>>>>> Stashed changes

void main() {
  runApp(const MyApp());
}

// Hãy luôn nhớ ghi chú cho từng dòng lệnh nhé !
//Ham main
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vietnam tourist',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Vietnam tourist'),
        ),
        body: Center(
          child: Text(
            'Hãy luôn nhớ ghi chú cho từng dòng lệnh nhé ! Cố lêfvn',
          ),
        ),
<<<<<<< Updated upstream
=======
        initialRoute: '/x',
        onGenerateRoute: RouteGenerator.generateRoute,
>>>>>>> Stashed changes
      ),
    );
  }
}
