import 'package:flutter/material.dart';

class HomeResponsive extends StatefulWidget {
  @override
  _HomeResponsiveState createState() => _HomeResponsiveState();
}

class _HomeResponsiveState extends State<HomeResponsive> {
  Future<bool> _onWillPop() async {
    // Navigator.of(context).push(
    //   new MaterialPageRoute(
    //       // aqui temos passagem de valores id cliente(sessao) de login para home
    //       builder: (context) => home(id_sessao: widget.id_sessao)),
    // );
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: _floatingActionButton(),
        body: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 150.0,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text('Available seats'),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add_circle),
                  tooltip: 'Add new entry',
                  onPressed: () { /* ... */ },
                ),
              ]
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Center(
                  child: Container(
                    height: 800,
                    width: 300,
                    color: Colors.blueGrey,
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/CreateFeedPage');
      },
      // child: customIcon(
      //   context,
      //   icon: AppIcon.fabTweet,
      //   istwitterIcon: true,
      //   iconColor: Theme.of(context).colorScheme.onPrimary,
      //   size: 25,
      // ),
      child: Icon(Icons.playlist_add),
    );
  }
}