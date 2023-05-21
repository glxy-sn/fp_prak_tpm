import 'package:flutter/material.dart';
import 'package:untitled/login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ngombe sik',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}