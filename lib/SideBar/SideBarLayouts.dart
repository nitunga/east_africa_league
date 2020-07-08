
import 'package:eastafricaleague/BottomNavigationBar/BottomNavigation.dart';
import 'package:eastafricaleague/Pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'SideBar.dart';
class SidebarLayouts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ligi kuu'),
        ),
        body:Stack(
       children: <Widget>[
        Homepage(),
        SideBar(),
      ],
    ),
        bottomNavigationBar:BottomNavigation());
  }
}
