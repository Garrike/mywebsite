import 'package:flutter/material.dart';
import 'package:gabrielmoreira/main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(131, 200, 209, 0.2),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(            
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Container(     
              height: 850,
              width: 1500,
              child: Center(child: Text('Home')),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white, 
              ),
            ),
          ),
        ),
      ),
    );
  }
}