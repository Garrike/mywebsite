import 'package:flutter/material.dart';
import 'package:gabrielmoreira/models/project.dart';
import 'package:gabrielmoreira/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dialog.dart';
import 'divider.dart';

Widget orderTimeLine(ScrollController _semicircleController) {
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
      child: timelineRow(projects, _semicircleController),
      controller: _semicircleController,
    ),
  );
}

Widget timelineRow(List<Project> projetos, ScrollController _semicircleController) {
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
                      child: Container(
                        color: Color.fromRGBO(39, 80, 115, 0.1),
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
                      child: Container(
                        color: Color.fromRGBO(39, 80, 115, 0.1),
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