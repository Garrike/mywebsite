import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gabrielmoreira/models/project.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

import '../services.dart';

List<Icon> icons = [
  Icon(Icons.star),
  Icon(Icons.navigation),
  Icon(Icons.golf_course)
];
List<Color> colors = [Colors.blue, Colors.tealAccent, Colors.redAccent];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 245, 246, 1),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                color: Color.fromRGBO(28, 28, 28, 1),
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * (4 / 9),
                    color: Color.fromRGBO(238, 245, 246, 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 90),
                          child: Text('Gabriel Moreira',
                            style: GoogleFonts.reemKufi(
                              fontSize: 28, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text('Estudante de Engenharia de Controle\ne Automação UFMT - Cuiabá, MT',
                            style: GoogleFonts.reemKufi(
                              fontSize: 15, fontWeight: FontWeight.bold, color: Color.fromRGBO(118,109,109, 1)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Color.fromRGBO(118,109,109, 1),
                                width: 0.4,
                              ),
                              bottom: BorderSide(
                                color: Color.fromRGBO(118,109,109, 1),
                                width: 0.4,
                              ),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 40.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('258',
                                      style: GoogleFonts.barlow(
                                      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text('Projetos Feitos',
                                      style: GoogleFonts.reemKufi(
                                      fontSize: 12, fontWeight: FontWeight.normal, color: Color.fromRGBO(118,109,109, 1)),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 40.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('113',
                                      style: GoogleFonts.barlow(
                                      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text('Em Andamento',
                                      style: GoogleFonts.reemKufi(
                                      fontSize: 12, fontWeight: FontWeight.normal, color: Color.fromRGBO(118,109,109, 1)),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('67',
                                    style: GoogleFonts.barlow(
                                    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text('Colaboradores',
                                    style: GoogleFonts.reemKufi(
                                    fontSize: 12, fontWeight: FontWeight.normal, color: Color.fromRGBO(118,109,109, 1)),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),                        
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 50, right: 50),
                          child: Text(
                            'Aqui você vai encontrar boa parte dos meus trabalhos relacionados a desenvolvimento,'
                            ' palestras, blog posts e minhas contribuições a projetos open-source. '
                            'Sinta-se à vontade para compartilhar e dar feedback no conteúdo.',
                            style: GoogleFonts.barlow(
                              fontSize: 18, fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 20, right: 40),
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage('https://logodownload.org/wp-content/uploads/2014/09/twitter-logo-1.png'),
                                )
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20, right: 30),
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage('https://www.egadvogados.com.br/advogado-ipsemg/wp-content/uploads/2019/03/4-41427_instagram-png-icon-instagram-logo-transparent.jpg'),
                                )
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20, right: 25),
                              height: 43,
                              width: 43,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage('https://github.githubassets.com/images/modules/open_graph/github-mark.png'),
                                )
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage('https://www.uninassau.edu.br/sites/mauriciodenassau.edu.br/files/fields/imagemCapa/noticias/2017/05/lattes.png'),
                                )
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * (5 / 9),
                    color: Color.fromRGBO(238, 245, 246, 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 40.0),
                                child: Text('PROJETOS',
                                  style: GoogleFonts.pTSans(
                                  fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(28, 28, 28, 1),),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 40.0),
                                child: Text('LIVROS',
                                  style: GoogleFonts.pTSans(
                                  fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(118,109,109, 1)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 40.0),
                                child: Text('FOTOS',
                                  style: GoogleFonts.pTSans(
                                  fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(118,109,109, 1),),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text('SOBRE',
                                style: GoogleFonts.pTSans(
                                fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(118,109,109, 1),),
                                textAlign: TextAlign.center,
                              ),
                              Expanded(child: Container()),
                              Container(
                                padding: EdgeInsets.only(right: 30),
                                child: Container(
                                  // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(28, 28, 28, 1),
                                    border: Border.all(
                                      color: Color.fromRGBO(28, 28, 28, 1),
                                      width: 1 
                                    ),
                                  ),
                                  child: FlatButton(
                                    onPressed: () {
                                      print('pressed');
                                    },
                                    child: Center(
                                      child: Text(
                                        'Follow',
                                        style: GoogleFonts.pTSans(
                                          fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(238, 245, 246, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),                        
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3 - 138,
            right: 70,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width / 4,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/TakeaBreak2.png'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            top: 0,//-20,
            left: (MediaQuery.of(context).size.width / 2) - 180,//132,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width / 4,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/teste.png'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height * 0.3) - 75,
            left: MediaQuery.of(context).size.width / 6,
            child: Container(
              width: 150.0,
              height: 150.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/profileImage.png"),
                ),
                border: Border.all(
                    width: 2, color: Color.fromRGBO(238, 245, 246, 1)),
                //   top: BorderSide(width: 30.0, color: Color.fromRGBO(238,245,246, 1)),
                //   bottom: BorderSide(width: 30.0, color: Color.fromRGBO(28, 28, 28, 1)),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  // timelineModel(TimelinePosition position) => Timeline.builder(
  //   itemBuilder: centerTimelineBuilder,
  //   itemCount: projects.length,
  //   physics: position == TimelinePosition.Left
  //       ? ClampingScrollPhysics()
  //       : BouncingScrollPhysics(),
  //   position: position);

  // TimelineModel centerTimelineBuilder(BuildContext context, int i) {
  //   // Project doodle = projects[i];
  //   // final textTheme = Theme.of(context).textTheme;
  //   return TimelineModel(
  //     Card(
  //       margin: EdgeInsets.symmetric(vertical: 8.0),
  //       shape:
  //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
  //       clipBehavior: Clip.antiAlias,
  //       child: Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Column(
  //           children: <Widget>[
  //             Container(
  //               width: 240.0,
  //               height: 190.0,
  //               decoration: new BoxDecoration(
  //                 image: new DecorationImage(
  //                   fit: BoxFit.cover,
  //                   image: NetworkImage(projects[i].image),
  //                 )
  //               ),
  //             ),
  //             SizedBox(
  //               height: 8.0,
  //             ),
  //             Row(
  //               children: <Widget>[
  //                 CircleAvatar(
  //                   child: icons[i],
  //                   backgroundColor: colors[i],
  //                 ),
  //                 Expanded(
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(left: 15.0),
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: <Widget>[
  //                         Text('${projects[i].title}', style: TextStyle(color: Colors.black),),
  //                         Row(
  //                           children: <Widget>[
  //                             Padding(
  //                               padding: const EdgeInsets.only(right: 10.0),
  //                               child: Text('${projects[i].date.toString()}', style: TextStyle(color: Colors.grey),),
  //                             ),
  //                             Padding(
  //                               padding: const EdgeInsets.only(right: 10.0),
  //                               child: Text('${projects[i].type}', style: TextStyle(color: Colors.grey),),
  //                             ),
  //                             Text('${projects[i].status}', style: TextStyle(color: Colors.grey),),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //                 Container(
  //                   width: 50,
  //                   child: Center(
  //                     child: Icon(Icons.open_in_browser),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //     position:
  //         i % 2 == 0 ? TimelineItemPosition.right : TimelineItemPosition.left,
  //     isFirst: i == 0,
  //     isLast: i == projects.length,
  //     iconBackground: colors[i],
  //     icon: icons[i]);
  // }
}
