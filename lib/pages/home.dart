import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gabrielmoreira/models/project.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

import '../services.dart';

List<Icon> icons = [Icon(Icons.star), Icon(Icons.navigation), Icon(Icons.golf_course)];
List<Color> colors = [Colors.blue, Colors.tealAccent, Colors.redAccent];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(160, 193, 184, 0.6),
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: NetworkImage("https://i.pinimg.com/564x/6c/06/ec/6c06ec1571eb73cebd1cde5464d8fd5d.jpg"),
        //     fit: BoxFit.fill,
        //   ),
        // ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate: MyDynamicHeader(),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 1.5,
                      width: MediaQuery.of(context).size.width / 1.2,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(8.0),
                      //   color: Color.fromRGBO(213, 219, 231, 1),
                      //   boxShadow: [
                      //     BoxShadow(
                      //       color: Colors.black26,
                      //       blurRadius: 2.0,
                      //     ),
                      //   ]
                      // ),
                      child: timelineModel(TimelinePosition.Center),
                    ),
                  ),
                ),          
              ]),
            ),
          ],
        ),
      )
    );
  }

  timelineModel(TimelinePosition position) => Timeline.builder(
    itemBuilder: centerTimelineBuilder,
    itemCount: projects.length,
    physics: position == TimelinePosition.Left
        ? ClampingScrollPhysics()
        : BouncingScrollPhysics(),
    position: position);

  TimelineModel centerTimelineBuilder(BuildContext context, int i) {
    // Project doodle = projects[i];
    // final textTheme = Theme.of(context).textTheme;
    return TimelineModel(
      Card(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                width: 240.0,
                height: 190.0,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(projects[i].image),
                  )
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    child: icons[i],
                    backgroundColor: colors[i],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('${projects[i].title}', style: TextStyle(color: Colors.black),),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text('${projects[i].date.toString()}', style: TextStyle(color: Colors.grey),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text('${projects[i].type}', style: TextStyle(color: Colors.grey),),
                              ),
                              Text('${projects[i].status}', style: TextStyle(color: Colors.grey),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    child: Center(
                      child: Icon(Icons.open_in_browser),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      position:
          i % 2 == 0 ? TimelineItemPosition.right : TimelineItemPosition.left,
      isFirst: i == 0,
      isLast: i == projects.length,
      iconBackground: colors[i],
      icon: icons[i]);
  }
}

class MyDynamicHeader extends SliverPersistentHeaderDelegate {
  int index = 0;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(builder: (context, constraints) {
      final Color color = Colors.primaries[index];
      final double percentage =
          (constraints.maxHeight - minExtent) / (maxExtent - minExtent);

      if (++index > Colors.primaries.length - 1) index = 0;

      return Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 4.0, color: Colors.black45)],
            // gradient: LinearGradient(colors: [Colors.blue, Colors.blue]),
            color: Color.fromRGBO(112, 159, 176, 0.9),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35.0),
                bottomRight: Radius.circular(35.0))),
        height: constraints.maxHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 70.0,
                    height: 70.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new NetworkImage(//Image profile
                                "https://i.pinimg.com/originals/a3/f9/d8/a3f9d867a54ca5163c7adf815040bfaf.jpg")))),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        'Gabriel Moreira',
                        style: GoogleFonts.rubik(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(213, 219, 231, 1)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30, top: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              width: 15.0,
                              height: 15.0,
                              decoration: new BoxDecoration(
                                  image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      image: new NetworkImage(//Image profile
                                          "https://image.flaticon.com/icons/svg/25/25231.svg")))),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text('GitHub', style: TextStyle(color: Color.fromRGBO(213, 219, 231, 1)),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Container(
                                width: 15.0,
                                height: 15.0,
                                decoration: new BoxDecoration(
                                    image: new DecorationImage(
                                        fit: BoxFit.cover,
                                        image: new NetworkImage(//Image profile
                                            "https://cdn4.iconfinder.com/data/icons/social-media-black-white-2/600/Instagram_glyph_svg-512.png")))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text('Instagram', style: TextStyle(color: Color.fromRGBO(213, 219, 231, 1)),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                percentage <= 0.6 ? Hero(
                  tag: 'project numbers',
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '10.2K',
                                style: GoogleFonts.rubik(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(213, 219, 231, 1)),
                              ),
                              Text(
                                'Projetos\nConcluídos',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.rubik(
                                    fontSize: 12,
                                    // fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(213, 219, 231, 1)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 40.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                '543',
                                style: GoogleFonts.rubik(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(213, 219, 231, 1)),
                              ),
                              Text(
                                'Projetos\nEm Andamento',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.rubik(
                                    fontSize: 12,
                                    // fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(213, 219, 231, 1)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white60),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Edit Profile',
                              style: GoogleFonts.rubik(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(213, 219, 231, 1)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ) : Container(),
              ],
            ),
            percentage > 0.6 ? Hero(
              tag: 'projects numbers',
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Opacity(
                  opacity: percentage,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '10.2K',
                              style: GoogleFonts.rubik(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(213, 219, 231, 1)),
                            ),
                            Text(
                              'Projetos\nConcluídos',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.rubik(
                                  fontSize: 12,
                                  // fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(213, 219, 231, 1)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              '543',
                              style: GoogleFonts.rubik(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(213, 219, 231, 1)),
                            ),
                            Text(
                              'Projetos\nEm Andamento',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.rubik(
                                  fontSize: 12,
                                  // fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(213, 219, 231, 1)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white60),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Edit Profile',
                            style: GoogleFonts.rubik(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(213, 219, 231, 1)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ) : Container(),
          ],
        ),
      );
    });
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;

  @override
  double get maxExtent => 250.0;

  @override
  double get minExtent => 110.0;
}