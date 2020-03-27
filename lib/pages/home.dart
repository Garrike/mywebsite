import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gabrielmoreira/widgets/bookList.dart';
import 'package:gabrielmoreira/widgets/dialog.dart';
import 'package:gabrielmoreira/widgets/timeline.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:js' as js;

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
                                  orderTimeLine(_semicircleController),
                                  Center(
                                    child: booklist(),
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
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 0,//-20,
            left: 0,//132,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/sky.png'),
                  fit: BoxFit.fitWidth),
              ),
            ),
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