import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gabrielmoreira/models/project.dart';
import 'package:gabrielmoreira/widgets/animated_timeline/price_tab.dart';
import 'package:gabrielmoreira/widgets/bookList.dart';
import 'package:gabrielmoreira/widgets/dialog.dart';
import 'package:gabrielmoreira/widgets/profile_mobile.dart';
// import 'package:gabrielmoreira/widgets/profile_desktop.dart';
// import 'package:gabrielmoreira/widgets/profile_mobile.dart';
import 'package:gabrielmoreira/widgets/timeline.dart';
import 'package:gabrielmoreira/widgets/timeline_mobile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../services.dart';

ScrollController _controller;
List<Project> projects = [];
PageController pageController = PageController(initialPage: 0);
int page = 0;
double top = 0, opacity = 1, heightTopo = 145, colorValue = 0;
Color titleColor = Color.fromRGBO(28, 28, 28, 1);
ScrollController _semicircleController = ScrollController();

class HomeMobile extends StatefulWidget {
  @override
  _HomeMobileState createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {

  @override
  void initState() {
    super.initState();
    getUser();
    _controller = ScrollController();
    
    _controller.addListener(() {
      if(_controller.offset <= 180 && !_controller.position.outOfRange) {
        print(_controller.offset);
        print(' Is Expanding');
        setState(() {    
          if(0.025 * _controller.offset <= 1) {
            opacity = 1 - (0.025 * _controller.offset);
          }           
          top = _controller.offset;
        });

        if(_controller.offset > 40) {
          setState(() {
            titleColor = Color.fromRGBO(238, 245, 246, 1);
          });
        } else {
          setState(() {
            titleColor = Color.fromRGBO(28, 28, 28, 1);
          });
        }

        if(_controller.offset <= 72.5) {
          setState(() {
            heightTopo = 145 - 2*_controller.offset;
          });
          print('Height: $heightTopo');
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        backgroundColor: Color.fromRGBO(238, 245, 246, 1),
        body: CustomScrollView(
          controller: _controller,
          slivers: <Widget>[            
            SliverAppBar(
              elevation: 0,
              expandedHeight: 180 + heightTopo,
              backgroundColor: Color.fromRGBO(28, 28, 28, 1),
              floating: false, 
              pinned: true, 
              snap: false,              
              flexibleSpace: FlexibleSpaceBar(
                // collapseMode: CollapseMode.none,
                centerTitle: false,
                // titlePadding: EdgeInsets.only(top: 265 - top),
                title: Text(
                  'Gabriel Moreira',
                  style: GoogleFonts.reemKufi(
                    fontSize: 22, 
                    fontWeight: FontWeight.bold,
                    color: titleColor
                  )
                ),
                background: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 180),
                      child: Container(                        
                        height: heightTopo,
                        color: Color.fromRGBO(238, 245, 246, 1),
                      ),
                    ),
                    Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      color: Color.fromRGBO(28, 28, 28, 1),
                    ),
                    Container(
                      height: 180,//MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/sky.png'),
                          fit: BoxFit.fitWidth),
                      ),
                    ),
                    Container(
                      height: 180,
                      width: sizingInformation.deviceScreenType == DeviceScreenType.Desktop
                        ? MediaQuery.of(context).size.width / 4
                        : MediaQuery.of(context).size.width, //1366 / 4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/teste.png'),
                          fit: sizingInformation.deviceScreenType == DeviceScreenType.Mobile
                            ? BoxFit.fitWidth
                            : BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      top: 105 - top,
                      left: sizingInformation.deviceScreenType == DeviceScreenType.Desktop
                        ? MediaQuery.of(context).size.width * (2 / 10) - 73 //MediaQuery.of(context).size.width / 7 + 5
                        : MediaQuery.of(context).size.width / 2 - 73,
                      child: Opacity(
                        opacity: opacity,
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
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  children: <Widget>[
                    profileMobile(context),
                    //timelinePages(sizingInformation),
                    ConstrainedBox(
                      constraints: new BoxConstraints(
                        minHeight: 200, //viewportConstraints.maxHeight - 48.0,
                      ),
                      child: new IntrinsicHeight(
                        child: PriceTab(
                          height: 200,
                          onPlaneFlightStart: () =>
                            print('object')  // setState(() => showInputTabOptions = false),
                        ),
                      ),
                    ),
                  ],
                ), 
              ])
            ),
          ],
        ),
      ),
    );
  }

  Widget timelinePages (SizingInformation sizingInformation) {
    return Container(
      height: sizingInformation.deviceScreenType == DeviceScreenType.Desktop
        ? 486.49
        : 650,
      width: sizingInformation.deviceScreenType == DeviceScreenType.Desktop
        ? MediaQuery.of(context).size.width * (3 / 5)
        : MediaQuery.of(context).size.width * 0.95,
      // width: 1366 * (6 / 10),
      color: Color.fromRGBO(238, 245, 246, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: sizingInformation.deviceScreenType == DeviceScreenType.Desktop
              ? linePages(sizingInformation)
              : Center(
                child: linePages(sizingInformation),
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
                    FutureBuilder(
                      future: getProjects(),
                      builder: (context, snapshot) {
                        if(snapshot.hasError) return Text('Error');
                        if(projects != null){
                          if(projects.isEmpty) projects = snapshot.data;
                        } else projects = snapshot.data;
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return Text('Não conectado');
                          case ConnectionState.waiting:
                            return Center(child: CircularProgressIndicator(),);
                          case ConnectionState.active:
                            return Text('Iniciou mas não terminou');
                          // case ConnectionState.done:
                          //   return Text('Finalizado');
                          default: 
                            return sizingInformation.deviceScreenType == DeviceScreenType.Mobile
                              ? orderTimeLineMobile(projects, _semicircleController)
                              : orderTimeLine(projects, _semicircleController);
                        }
                      }
                    ),
                    Center(
                      child: booklist(),
                      // child: Text('Books'),
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
    );
  }

  Widget linePages (SizingInformation sizingInformation) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      // runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      // verticalDirection: VerticalDirection.up,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color.fromRGBO(28, 28, 28, 1),
                width: page == 0 ? 2 : 0.5
              )
            ),
          ),
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
                fontSize: sizingInformation.deviceScreenType == DeviceScreenType.Desktop
                  ? 20
                  : 14, 
                fontWeight: FontWeight.bold, 
                color: page == 0 ? Color.fromRGBO(28, 28, 28, 1) : Color.fromRGBO(118,109,109, 1),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color.fromRGBO(28, 28, 28, 1),
                width: page == 1 ? 2 : 0.5
              )
            ),
          ),
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
                fontSize: sizingInformation.deviceScreenType == DeviceScreenType.Desktop
                  ? 20
                  : 14,  
                fontWeight: FontWeight.bold, 
                color: page == 1 ? Color.fromRGBO(28, 28, 28, 1) : Color.fromRGBO(118,109,109, 1)
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color.fromRGBO(28, 28, 28, 1),
                width: page == 2 ? 2 : 0.5
              )
            ),
          ),
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
                fontSize: sizingInformation.deviceScreenType == DeviceScreenType.Desktop
                  ? 20
                  : 14,  
                fontWeight: FontWeight.bold, 
                color: page == 2 ? Color.fromRGBO(28, 28, 28, 1) : Color.fromRGBO(118,109,109, 1),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color.fromRGBO(28, 28, 28, 1),
                width: page == 3 ? 2 : 0.5
              )
            ),
          ),
          child: FlatButton(
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
                fontSize: sizingInformation.deviceScreenType == DeviceScreenType.Desktop
                  ? 20
                  : 14,  
                fontWeight: FontWeight.bold, 
                color: page == 3 ? Color.fromRGBO(28, 28, 28, 1) : Color.fromRGBO(118,109,109, 1),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        // sizingInformation.deviceScreenType == DeviceScreenType.Desktop ? Expanded(child: Container()) : Container(),
        // sizingInformation.deviceScreenType == DeviceScreenType.Desktop 
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
          // : Container(),
        Container(width: 20,),
      ],
    );
  }
}