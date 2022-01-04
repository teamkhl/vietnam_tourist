import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/screens/landing.dart';
import '/screens/main_screen.dart';
import '/screens/post_detail.dart';
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
    return BlocProvider.value(
      value: _authcubitCubit,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/main_screen',
        routes: <String, WidgetBuilder>{
          '/': (context) => Landing(),
          '/main_screen': (context) => TabScreen(),
          '/post_detail': (context) => PostDetail(),
          '/search': (context) => Search(),
        },
      ),
    );
  }
}
