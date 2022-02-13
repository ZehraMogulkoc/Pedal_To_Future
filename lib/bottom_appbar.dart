import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_fest/google_map.dart';
import 'package:flutter_fest/homepage.dart';
import 'package:flutter_fest/screens/home/startScreen.dart';
import 'daily_steps.dart';
import 'drawer.dart';
import 'end_drawer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'leaderboard.dart';
import 'prizes.dart';
class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _pageIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  List pages = [
    MyRoute(
      iconData: Icons.home,
      page: HomePage(),
    ),
    MyRoute(
      iconData: Icons.directions_run_sharp,
      page: DailyStepsCount(),
    ),
    MyRoute(
      iconData: Icons.flare_outlined,
      page: StartScreen(),
    ),
    MyRoute(
      iconData: Icons.map,
      page: MapPage(),
    ),
    MyRoute(
      iconData: Icons.card_giftcard_outlined,
      page: Prizes(),
    ),
    MyRoute(
      iconData: Icons.leaderboard_outlined,
      page:LeaderBoard()
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Below makes the text above title white (=dark) or black (=light)
        brightness: Brightness.dark,
        title: Text('Pedal to Future'),
        // Below makes the AppBar background a desired color
        backgroundColor: Color(0xFF789373),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          )
        ],
      ),
      drawer: new MyDrawer(),
      endDrawer: new MyEndDrawer(),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: pages
            .map(
              (p) => Icon(
            p.iconData,
            size: 30,
            color: Colors.white,
          ),
        )
            .toList(),
        color: Color(0xFF789373),
        buttonBackgroundColor: Color(0xFF0C3102),
        backgroundColor: Color(0xFF3E503C),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 500),
        onTap: (index) {
          setState(
                () {
              _pageIndex = index;
            },
          );
        },
      ),
      backgroundColor: Colors.white,
      body: pages[_pageIndex].page,
    );
  }
}

class MyRoute {
  final IconData iconData;
  final Widget page;

  MyRoute({required this.iconData, required this.page});
}
