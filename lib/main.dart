import 'package:flutter/material.dart';
import 'package:svu_beta/choosing_university.dart';
import 'package:svu_beta/login_withmysql.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Gilroy'),
      home: login_screen(),
    );
  }
}
