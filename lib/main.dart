import 'package:flutter/material.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Vietnam tourist'),
        ),
        body: Center(
          child: Text(
            'Hãy luôn nhớ ghi chú cho từng dòng lệnh nhé ! Cố lên',
          ),
        ),
      ),
    );
  }
}
