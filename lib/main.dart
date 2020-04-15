// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gabrielmoreira/pages/home.dart';
import 'package:gabrielmoreira/pages/home_mobile.dart';
// import 'package:gabrielmoreira/pages/home_responsive.dart';
// import 'package:gabrielmoreira/services.dart';

final pageController = PageController(initialPage: 0, keepPage: false);
int page;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gabriel Moreira',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.black,
      ),
      home: InitialPage(),
    );
  }
}

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {

  @override
  void initState() {
    super.initState();
    page = 0;
    // initiateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return HomeMobile();
  }
}