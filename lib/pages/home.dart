import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services.dart';
// import 'package:gabrielmoreira/main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Color.fromRGBO(131, 200, 209, 0.2),
    //   appBar: AppBar(
    //     title: Text('AppBar'),
    //   ),
    //   body: SingleChildScrollView(
    //     child: Center(
    //       child: Padding(
    //         padding: EdgeInsets.symmetric(vertical: 10),
    //         child: Container(
    //           height: MediaQuery.of(context).size.height,
    //           width: MediaQuery.of(context).size.width / 1.5,
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(8.0),
    //             color: Colors.white,
    //             boxShadow: [
    //               BoxShadow(
    //                 color: Colors.black26,
    //                 blurRadius: 2.0,
    //               ),
    //             ]
    //           ),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: <Widget>[
    //               Container(
    //                 margin: EdgeInsets.only(top: 20),
    //                 width: 190.0,
    //                 height: 190.0,
    //                 decoration: new BoxDecoration(
    //                     shape: BoxShape.circle,
    //                     image: new DecorationImage(
    //                         fit: BoxFit.cover,
    //                         image: new NetworkImage( //Image profile
    //                             "https://i.pinimg.com/originals/a3/f9/d8/a3f9d867a54ca5163c7adf815040bfaf.jpg")
    //                     )
    //                 )
    //               ),
    //               Padding(
    //                 padding: EdgeInsets.only(top: 30),
    //                 child: Text('Welcome to my world.', style: GoogleFonts.sourceCodePro(fontSize: 30),),
    //               ),
    //               Padding(
    //                 padding: EdgeInsets.only(top: 15, left: 60, right: 60),
    //                 child: Text(
    //                   'Aqui você vai encontrar boa parte dos meus trabalhos relacionados a desenvolvimento,'
    //                   'palestras, blog posts e minhas contribuições a projetos open-source.'
    //                   'Sinta-se à vontade para compartilhar e dar feedback no conteúdo.', //Descrição
    //                   style: GoogleFonts.roboto(fontSize: 18),
    //                   textAlign: TextAlign.center,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
        backgroundColor: Color.fromRGBO(131, 200, 209, 0.2),
        body: Container(
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
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width / 1.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 2.0,
                            ),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 20),
                              width: 190.0,
                              height: 190.0,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      image: new NetworkImage(//Image profile
                                          "https://i.pinimg.com/originals/a3/f9/d8/a3f9d867a54ca5163c7adf815040bfaf.jpg")))),
                          Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Text(
                              'Welcome to my world.',
                              style: GoogleFonts.sourceCodePro(fontSize: 30),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 15, left: 60, right: 60),
                            child: Text(
                              'Aqui você vai encontrar boa parte dos meus trabalhos relacionados a desenvolvimento,'
                              'palestras, blog posts e minhas contribuições a projetos open-source.'
                              'Sinta-se à vontade para compartilhar e dar feedback no conteúdo.', //Descrição
                              style: GoogleFonts.roboto(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        )));
  }
}

class MyDynamicHeader extends SliverPersistentHeaderDelegate {
  int index = 0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(builder: (context, constraints) {
      final Color color = Colors.primaries[index];
      final double percentage =
          (constraints.maxHeight - minExtent) / (maxExtent - minExtent);

      if (++index > Colors.primaries.length - 1) index = 0;

      return Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 4.0, color: Colors.black45)],
            gradient: LinearGradient(colors: [Colors.blue, Colors.blue]),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0))),
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
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
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
                            child: Text('GitHub'),
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
                            child: Text('Instagram'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            percentage > 0.6 ? Opacity(
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
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'Projetos\nConcluídos',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.rubik(
                              fontSize: 15,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white),
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
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'Projetos\nEm Andamento',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.rubik(
                              fontSize: 15,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white),
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
                          color: Colors.white),
                      ),
                    ),
                  ),
                ],
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
  double get minExtent => 170.0;
}
