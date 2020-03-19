import 'package:flutter/material.dart';
// import 'package:gabrielmoreira/main.dart';

class TimeLine extends StatefulWidget {
  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(131, 200, 209, 0.2),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(            
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Container(     
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 1.5,
              child: Center(child: Text('TimeLine')),
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