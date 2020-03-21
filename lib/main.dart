// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gabrielmoreira/pages/home.dart';
import 'package:gabrielmoreira/services.dart';
import 'package:google_fonts/google_fonts.dart';

final pageController = PageController(initialPage: 0, keepPage: false);
int page;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
    initiateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Home();
    // return CustomScrollView(
    //   slivers: [
    //     // SliverPersistentHeader(
    //     //   delegate: MySliverAppBar(expandedHeight: 200),
    //     //   pinned: true,
    //     // ),
    //     SliverAppBar(
    //       title: Text('Gabriel Moreira'),
    //     ),
    //     Container(),
    //   ],
    // );

    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Color.fromRGBO(7, 80, 97, 1),
    //     title: Padding(
    //       padding: const EdgeInsets.only(left: 30.0),
    //       child: Text(r'\\ Gabriel Moreira', style: TextStyle(fontSize: 24),),
    //     ),
    //     bottom: PreferredSize(
    //       preferredSize: const Size.fromHeight(48.0),
    //       child: Container(
    //         height: 40.0,
    //         color: Color.fromRGBO(191, 221, 222, 1),
    //         alignment: Alignment.center,
    //         child: ListView(
    //           shrinkWrap: true,
    //           scrollDirection: Axis.horizontal,
    //           children: <Widget>[                    
    //             FlatButton(
    //               onPressed: () {
    //                 pageController.jumpToPage(0);
    //                 setState(() {
    //                   page = 0;
    //                 });
    //               },
    //               child: Container(
    //                 height: 40.0,
    //                 width: 160,                  
    //                 child: Center(child: Text('HOME', style: GoogleFonts.roboto(fontSize: 18),)),
    //                 decoration: page == 0 ? BoxDecoration(
    //                   color: Colors.transparent,
    //                   border: Border(
    //                     bottom: BorderSide(
    //                       color: Color.fromRGBO(4, 36, 52, 1),
    //                       width: 2.0,
    //                     ),
    //                   ),
    //                 ) : BoxDecoration(color: Colors.transparent),
    //               ),
    //             ),
    //             FlatButton(
    //               onPressed: () {
    //                 pageController.jumpToPage(1);
    //                 setState(() {
    //                   page = 1;
    //                 });
    //               },
    //               child: Container(
    //                 height: 40.0,
    //                 width: 160,
    //                 child: Center(child: Text('TIMELINE', style: GoogleFonts.roboto(fontSize: 18),)),
    //                 decoration: page == 1 ? BoxDecoration(
    //                   color: Colors.transparent,
    //                   border: Border(
    //                     bottom: BorderSide(
    //                       color: Color.fromRGBO(4, 36, 52, 1),
    //                       width: 2.0,
    //                     ),
    //                   ),
    //                 ) : BoxDecoration(color: Colors.transparent),
    //               ),
    //             ),
    //             Container(
    //               height: 40.0,
    //               width: 160,
    //               child: Center(child: Text('VIDEOS', style: GoogleFonts.roboto(fontSize: 18),)),
    //               decoration: page == 2 ? BoxDecoration(
    //                 color: Colors.transparent,
    //                 border: Border(
    //                   bottom: BorderSide(
    //                     color: Color.fromRGBO(4, 36, 52, 1),
    //                     width: 2.0,
    //                   ),
    //                 ),
    //               ) : BoxDecoration(color: Colors.transparent),
    //             ),
    //             Container(
    //               height: 40.0,
    //               width: 160,
    //               color: Colors.transparent,
    //               child: Center(child: Text('PROJECTS', style: GoogleFonts.roboto(fontSize: 18),)),
    //             ),
    //             Container(
    //               height: 40.0,
    //               width: 160,
    //               color: Colors.transparent,
    //               child: Center(child: Text('BLOG', style: GoogleFonts.roboto(fontSize: 18),)),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    //   body: PageView(
    //     controller: pageController,
    //     children: <Widget>[
    //       Home(),
    //       TimeLine(),
    //     ],
    //   ),
    // );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Image.network(
          "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          fit: BoxFit.cover,
        ),
        Center(
          child: Text(
            "MySliverAppBar",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 23,
            ),
          ),
        ),
        // Positioned(
        //   top: expandedHeight / 2 - shrinkOffset,
        //   left: MediaQuery.of(context).size.width / 4,
        //   child: Opacity(
        //     opacity: (1 - shrinkOffset / expandedHeight),
        //     child: Card(
        //       elevation: 10,
        //       child: SizedBox(
        //         height: expandedHeight,
        //         width: MediaQuery.of(context).size.width / 2,
        //         child: FlutterLogo(),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 150;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}