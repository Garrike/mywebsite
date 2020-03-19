import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:gabrielmoreira/main.dart';

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
                ]
              ),
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
                            image: new NetworkImage( //Image profile
                                "https://i.pinimg.com/originals/a3/f9/d8/a3f9d867a54ca5163c7adf815040bfaf.jpg")
                        )
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text('Welcome to my world.', style: GoogleFonts.sourceCodePro(fontSize: 30),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, left: 60, right: 60),
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
      ),
    );
  }
}