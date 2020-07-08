import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eastafricaleague/SideBar/SideBarLayouts.dart';
import 'package:flutter/material.dart';

import 'BottomNavigationBar/BottomNavigation.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tanzania Premier League',
      theme: ThemeData(
       scaffoldBackgroundColor: Colors.white,
       primaryColor: Colors.blueAccent,
      ),
      home:SidebarLayouts(),
    );
  }
}