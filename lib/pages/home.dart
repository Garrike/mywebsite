import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gabrielmoreira/models/project.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'dart:js' as js;
import '../services.dart';

PageController pageController = PageController(initialPage: 0);
int page = 0;
List<Icon> icons = [
  Icon(Icons.star),
  Icon(Icons.navigation),
  Icon(Icons.golf_course)
];
List<Color> colors = [Colors.blue, Colors.tealAccent, Colors.redAccent];
ScrollController _semicircleController = ScrollController();

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
                            InkWell(
                              onTap: () {
                                js.context.callMethod("open", ["https://twitter.com/m0reira_gabriel"]);
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 20, right: 40),
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage('https://logodownload.org/wp-content/uploads/2014/09/twitter-logo-1.png'),
                                  )
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                js.context.callMethod("open", ["https://www.instagram.com/tabordagm/"]);
                              },
                              child: Container(
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
                            ),
                            InkWell(
                              onTap: () {
                                js.context.callMethod("open", ["https://github.com/Garrike"]);
                              },
                              child: Container(
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
                            ),
                            InkWell(
                              onTap: () {
                                js.context.callMethod("open", ["http://lattes.cnpq.br/7329960069240407"]);
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 20, right: 35),
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage('https://www.uninassau.edu.br/sites/mauriciodenassau.edu.br/files/fields/imagemCapa/noticias/2017/05/lattes.png'),
                                  )
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                js.context.callMethod("open", ["http://gmail.com"]);
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 20, right: 5),
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage('https://imagepng.org/wp-content/uploads/2018/03/gmail-cone-icon-1.png'),
                                  )
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Text('g.tabordamoreira@gmail.com',
                                style: GoogleFonts.reemKufi(
                                  fontSize: 14, fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),                        
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
                                child: FlatButton(
                                  onPressed: () {
                                    print('pressed Projetos');
                                    // pageController.jumpToPage(0);
                                    pageController.animateToPage(0, duration: Duration(seconds: 2), curve: Curves.easeInOut);
                                    setState(() {
                                      page = 0;
                                    });
                                  }, 
                                  focusColor: Color.fromRGBO(28, 28, 28, 1),
                                  splashColor: Color.fromRGBO(28, 28, 28, 1),                                  
                                  child: Text('PROJETOS',
                                    style: GoogleFonts.pTSans(
                                      fontSize: 20, 
                                      fontWeight: FontWeight.bold, 
                                      color: page == 0 ? Color.fromRGBO(28, 28, 28, 1) : Color.fromRGBO(118,109,109, 1),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 40.0),
                                child: FlatButton(
                                  onPressed: () {
                                    print('pressed Livros');
                                    // pageController.jumpToPage(1);
                                    pageController.animateToPage(1, duration: Duration(seconds: 2), curve: Curves.easeInOut);
                                    setState(() {
                                      page = 1;
                                    });
                                  }, 
                                  focusColor: Color.fromRGBO(28, 28, 28, 1),
                                  splashColor: Color.fromRGBO(28, 28, 28, 1),
                                  child: Text('LIVROS',
                                    style: GoogleFonts.pTSans(
                                      fontSize: 20, 
                                      fontWeight: FontWeight.bold, 
                                      color: page == 1 ? Color.fromRGBO(28, 28, 28, 1) : Color.fromRGBO(118,109,109, 1)
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 40.0),
                                child: FlatButton(
                                  onPressed: () {
                                    print('pressed Fotos');
                                    // pageController.jumpToPage(2);
                                    pageController.animateToPage(2, duration: Duration(seconds: 2), curve: Curves.easeInOut);
                                    setState(() {
                                      page = 2;
                                    });
                                  }, 
                                  focusColor: Color.fromRGBO(28, 28, 28, 1),
                                  splashColor: Color.fromRGBO(28, 28, 28, 1),
                                  child: Text('FOTOS',
                                    style: GoogleFonts.pTSans(
                                      fontSize: 20, 
                                      fontWeight: FontWeight.bold, 
                                      color: page == 2 ? Color.fromRGBO(28, 28, 28, 1) : Color.fromRGBO(118,109,109, 1),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              FlatButton(
                                onPressed: () {
                                  print('pressed About');
                                  // pageController.jumpToPage(3);
                                  pageController.animateToPage(3, duration: Duration(seconds: 2), curve: Curves.easeInOut);
                                  setState(() {
                                    page = 3;
                                  });
                                }, 
                                focusColor: Color.fromRGBO(28, 28, 28, 1),
                                splashColor: Color.fromRGBO(28, 28, 28, 1),
                                child: Text('SOBRE',
                                  style: GoogleFonts.pTSans(
                                    fontSize: 20, 
                                    fontWeight: FontWeight.bold, 
                                    color: page == 3 ? Color.fromRGBO(28, 28, 28, 1) : Color.fromRGBO(118,109,109, 1),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(child: Container()),
                              RaisedButton(
                                onPressed: () {
                                  print('FOLLOW');
                                  showAlertDialog(context);
                                },
                                color: Color.fromRGBO(28, 28, 28, 1),
                                splashColor: Color.fromRGBO(115,158,171, 1),
                                child: Text(
                                  'Follow',
                                  style: GoogleFonts.pTSans(
                                    fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(238, 245, 246, 1),
                                  ),
                                ),
                              ),
                              Container(width: 20,),
                            ],
                          ),
                        ),    
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0, bottom: 5),
                            child: Container(
                              child: PageView(
                                scrollDirection: Axis.horizontal,
                                physics: NeverScrollableScrollPhysics(),
                                controller: pageController,
                                children: <Widget>[
                                  orderTimeLine(),
                                  Center(
                                    child: Text('Livros'),
                                  ),
                                  Center(
                                    child: Text('Fotos'),
                                  ),
                                  Center(
                                    child: Text('Sobre'),
                                  ),
                                ],
                              )
                            ),
                          ),
                        ),  
                        // Container(height: 20),               
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
                  width: 2, 
                  color: Color.fromRGBO(238, 245, 246, 1)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget orderTimeLine() {
  return Container(
    height: 500,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border(
        top: BorderSide(
          color: Color.fromRGBO(28, 28, 28, 1),
          width: 0.4, 
        ),
        bottom: BorderSide(
          color: Color.fromRGBO(28, 28, 28, 1),
          width: 0.4, 
        ),
      ),
    ),
    margin: EdgeInsets.only(
      bottom: 5,//SizeConfig.safeBlockHorizontal * 3,
      top: 5
    ),
    padding: EdgeInsets.only(
      top: 9,//SizeConfig.safeBlockHorizontal * 3,
      left: 9,//SizeConfig.safeBlockHorizontal * 7,
      bottom: 9,//SizeConfig.safeBlockHorizontal * 3,
    ),
    child: Scrollbar(
      child: timelineRow(projects),
      controller: _semicircleController,
    ),
    // child: DraggableScrollbar.semicircle(
    //   labelTextBuilder: (offset) {
    //     final int currentItem = _semicircleController.hasClients
    //         ? (_semicircleController.offset /
    //                 _semicircleController.position.maxScrollExtent *
    //                 projects.length)
    //             .floor()
    //         : 0;
    //     return Text("$currentItem");
    //   },
    //   labelConstraints: BoxConstraints.tightFor(width: 80.0, height: 30.0),
    //   controller: _semicircleController,
    //   child: timelineRow(projects),
    // ),
    
    // child: Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   crossAxisAlignment: CrossAxisAlignment.center,      
    //   children: <Widget>[
    //     timelineRow(projects),
    //     // timelineRow("Order Inprocess", 'orderDateTime2', 1),
    //     // timelineRow("Order Processed", "", 2),
    //     // timelineRow("Order Shipped", "", 3),
    //     // timelineLastRow("Order Delivered", ""),
    //   ],
    // ),
  );
}

Widget timelineRow(List<Project> projetos) {
  return ListView.builder(
    controller: _semicircleController,
    shrinkWrap: true,
    itemCount: (projetos.length / 2).round(),
    itemBuilder: (context, index) {
      return Container(
        height: 420,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            (2 * index) < projetos.length ? Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  MySeparator(),
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: () {
                      print('Card Tapped');
                      showAlertDialog(context);
                    },
                    focusColor: Colors.black38,
                    splashColor: Color.fromRGBO(28, 28, 28, 0.8),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 180,
                              width: 300,
                              // color: Color.fromRGBO(28, 28, 28, 1),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(projetos[2 * index].image), //'https://i.pinimg.com/564x/5e/22/57/5e2257e21795e60de9c58e59a6b05fb6.jpg'
                                  fit: BoxFit.cover
                                )
                              ),
                            ),
                            SizedBox(height: 5),
                            Text('${projetos[2 * index].title}',
                              style: GoogleFonts.robotoSlab(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                              textAlign: TextAlign.justify,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Status: ${projetos[2 * index].status}',
                                  style: GoogleFonts.robotoSlab(
                                    fontSize: 12, 
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(118, 109, 109, 1),
                                  ),
                                ),
                                Expanded(child: Container()),
                                Text(
                                  '${projetos[2 * index].likes}',
                                  style: GoogleFonts.robotoSlab(
                                    fontSize: 12, 
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(28, 28, 28, 0.8),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.favorite, color: Color.fromRGBO(28, 28, 28, 0.8), size: 16), 
                                  onPressed: () {}
                                ),
                                // SizedBox(width: 5,),
                                Text(
                                  '${projetos[2 * index].comments.length}',
                                  style: GoogleFonts.robotoSlab(
                                    fontSize: 12, 
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(28, 28, 28, 0.8),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.comment, color: Color.fromRGBO(28, 28, 28, 0.8), size: 16), 
                                  onPressed: () {}
                                ),
                              ],
                            ),
                            Text('${projetos[2 * index].description}',
                              style: GoogleFonts.reemKufi(fontSize: 16, color: Colors.black87),
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 180,
                                  height: 25,
                                  child: Center(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: projetos[2 * index].tags.length,
                                      itemBuilder: (context, i) {
                                        return Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Container(
                                            color: Color.fromRGBO(28, 28, 28, 0.9),
                                            padding: EdgeInsets.all(5),
                                            // splashColor: Color.fromRGBO(115,158,171, 0.6),                                  
                                            child: Text(
                                              '${projetos[2 * index].tags[i]}',
                                              style: GoogleFonts.robotoSlab(
                                                fontSize: 10, 
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(238, 245, 246, 1)
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    ),
                                  ),
                                ),
                                Expanded(child: Container()),
                                InkWell(
                                  enableFeedback: true,
                                  onTap: () {
                                    print('Continue tapped');
                                    showAlertDialog(context);
                                  },
                                  focusColor: Colors.black38,
                                  splashColor: Color.fromRGBO(28, 28, 28, 0.8),
                                  child: Text(
                                    'Continue lendo..',
                                    style: GoogleFonts.robotoSlab(
                                      fontSize: 11, 
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(28, 28, 28, 1),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 20)
                ],
              ),
            ) : Expanded(flex: 4, child: Container()),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  (2 * index) < projetos.length ? Container(
                    width: 37,
                    height: 37,
                    decoration: new BoxDecoration(
                      color: Color.fromRGBO(28, 28, 28, 1),
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${projetos[2 * index].date.day.toString()}", 
                          style: GoogleFonts.barlow(
                            fontSize: 14, 
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(238, 245, 246, 1)
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Mar", 
                          style: GoogleFonts.barlow(
                            fontSize: 12, 
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(238, 245, 246, 1)
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ) : Container(),
                  (2 * index) < projetos.length ? Container(
                    width: 3,
                    height: 35,
                    decoration: new BoxDecoration(
                      color: Color.fromRGBO(28, 28, 28, 1),
                      shape: BoxShape.rectangle,
                    ),
                    child: Text(""),
                  ) : Container(),

                  (2 * index) + 1 < projetos.length ? Container(
                    width: 37,
                    height: 37,
                    decoration: new BoxDecoration(
                      color: Color.fromRGBO(28, 28, 28, 1),
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${projetos[2 * index + 1].date.day.toString()}", 
                          style: GoogleFonts.barlow(
                            fontSize: 14, 
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(238, 245, 246, 1)
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Mar", 
                          style: GoogleFonts.barlow(
                            fontSize: 12, 
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(238, 245, 246, 1)
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ) : Container(),
                  (2 * index) + 1 <= projetos.length ? Expanded(
                    child: Container(
                      width: 3,
                      decoration: new BoxDecoration(
                        color: Color.fromRGBO(28, 28, 28, 1),
                        shape: BoxShape.rectangle,
                      ),
                      child: Text(""),
                    ),
                  ) : Container(),
                  (2 * index) + 1 == projetos.length ? InkResponse(
                    onTap: () {
                      print('tapped');
                      _semicircleController.animateTo(0, curve: Curves.easeInOut, duration: Duration(seconds: 2));
                    },
                    child: Container(
                      width: 37,
                      height: 37,
                      decoration: new BoxDecoration(
                        color: Color.fromRGBO(28, 28, 28, 1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.keyboard_arrow_up, color: Color.fromRGBO(238, 245, 246, 1), size: 26),
                    ),
                  ): Container(),
                ],
              ),
            ),
            (2 * index) + 1 < projetos.length ? Expanded(
              flex: 4,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Expanded(child: Container(color: Colors.blueAccent,),),
                  // SizedBox(height: 55),
                  MySeparator(),
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: () {
                      print('Card Tapped');
                      showAlertDialog(context);
                    },
                    focusColor: Colors.black38,
                    splashColor: Color.fromRGBO(28, 28, 28, 0.8),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 180,
                              width: 300,
                              // color: Color.fromRGBO(28, 28, 28, 1),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(projetos[2 * index + 1].image), //'https://i.pinimg.com/564x/5e/22/57/5e2257e21795e60de9c58e59a6b05fb6.jpg'
                                  fit: BoxFit.cover
                                )
                              ),
                            ),
                            SizedBox(height: 5),
                            Text('${projetos[2 * index + 1].title}',
                              style: GoogleFonts.robotoSlab(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                              textAlign: TextAlign.justify
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Status: ${projetos[2 * index + 1].status}',
                                  style: GoogleFonts.robotoSlab(
                                    fontSize: 12, 
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(118, 109, 109, 1),
                                  ),
                                ),
                                Expanded(child: Container()),
                                Text(
                                  '${projetos[2 * index + 1].likes}',
                                  style: GoogleFonts.robotoSlab(
                                    fontSize: 12, 
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(28, 28, 28, 0.8),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.favorite, color: Color.fromRGBO(28, 28, 28, 0.8), size: 16), 
                                  onPressed: () {}
                                ),
                                // SizedBox(width: 5,),
                                Text(
                                  '${projetos[2 * index + 1].comments.length}',
                                  style: GoogleFonts.robotoSlab(
                                    fontSize: 12, 
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(28, 28, 28, 0.8),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.comment, color: Color.fromRGBO(28, 28, 28, 0.8), size: 16), 
                                  onPressed: () {}
                                ),
                              ],
                            ),
                            Text('${projetos[2 * index + 1].description}',
                              style: GoogleFonts.reemKufi(fontSize: 16, color: Colors.black87),
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 180,
                                  height: 25,
                                  child: Center(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: projetos[2 * index + 1].tags.length,
                                      itemBuilder: (context, i) {
                                        return Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Container(
                                            color: Color.fromRGBO(28, 28, 28, 0.9),
                                            padding: EdgeInsets.all(5),
                                            // splashColor: Color.fromRGBO(115,158,171, 0.6),                                  
                                            child: Text(
                                              '${projetos[2 * index + 1].tags[i]}',
                                              style: GoogleFonts.robotoSlab(
                                                fontSize: 10, 
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(238, 245, 246, 1)
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    ),
                                  ),
                                ),
                                Expanded(child: Container()),
                                InkWell(
                                  enableFeedback: true,
                                  onTap: () {
                                    print('Continue tapped');
                                    showAlertDialog(context);
                                  },
                                  focusColor: Colors.black38,
                                  splashColor: Color.fromRGBO(28, 28, 28, 0.8),
                                  child: Text(
                                    'Continue lendo..',
                                    style: GoogleFonts.robotoSlab(
                                      fontSize: 11, 
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(28, 28, 28, 1),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ) : Expanded(flex: 4, child: Container(height: 30,)),
          ],
        ),
      );
    }
  );
}

Widget timelineLastRow(String title, String subTile) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Expanded(
        flex: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 18,
              height: 18,
              decoration: new BoxDecoration(
                color: Color.fromRGBO(28, 28, 28, 1),
                shape: BoxShape.circle,
              ),
              child: Text(""),
            ),
            Container(
              width: 3,
              height: 20,
              decoration: new BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.rectangle,
              ),
              child: Text(""),
            ),
          ],
        ),
      ),
      Expanded(
        flex: 9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('$title\n $subTile',
                style: TextStyle(
                    fontFamily: "regular",
                    fontSize: 14,
                    color: Colors.black54)),
          ],
        ),
      ),
    ],
  );
}

class MySeparator extends StatelessWidget {
  final double height;
  final Color color;

  const MySeparator({this.height = 1, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

showAlertDialog(BuildContext context) 
{ 
    // configura o button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Tapped"),
    content: Text("New Screen Page"),
    actions: [
      okButton,
    ],
  );

  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}