import 'package:flutter/material.dart';
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

void main() {
  runApp(MyApp());
}

// Hãy luôn nhớ ghi chú cho từng dòng lệnh nhé !
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AuthcubitCubit _authcubitCubit = AuthcubitCubit();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => PostProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => PlacenameProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => PostPictureProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => PlacenamePictureProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => PostCommentProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}

// BlocProvider.value(
//       value: _authcubitCubit,
//       child: