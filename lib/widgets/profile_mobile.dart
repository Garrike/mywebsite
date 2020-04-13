import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:js' as js;

Widget profileMobile (BuildContext context) {
  return Container(
    // height: MediaQuery.of(context).size.height * 0.7,
    height: 560,//486.49,
    // width: MediaQuery.of(context).size.width * (4 / 10),
    // width: 1366 * (4 / 10),
    // color: Color.fromRGBO(238, 245, 246, 1),
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
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runSpacing: 10.0,
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // runAlignment: WrapAlignment.center,
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
                ),                            
              ],
            ),
            InkWell(
              onTap: () {
                js.context.callMethod("open", ["http://gmail.com"]);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage('https://imagepng.org/wp-content/uploads/2018/03/gmail-cone-icon-1.png'),
                      )
                    ),
                  ),
                  Container(
                    child: Text('g.tabordamoreira@gmail.com',
                      style: GoogleFonts.reemKufi(
                        fontSize: 14, fontWeight: FontWeight.bold
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
  );
}