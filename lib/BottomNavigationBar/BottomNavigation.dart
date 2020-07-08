import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
class BottomNavigation  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (
    CurvedNavigationBar(
    color: Colors.blueAccent,
    backgroundColor: Colors.white,
    height: 50,
    items: <Widget>[
    Icon(Icons.new_releases,size: 20,color: Colors.yellowAccent),
    Icon(Icons.live_help,size: 20,color: Colors.yellowAccent),
    Icon(Icons.live_help,size: 20,color: Colors.yellowAccent),
    Icon(Icons.beenhere,size: 20,color: Colors.yellowAccent),
    Icon(Icons.new_releases,size: 20,color: Colors.yellowAccent),
],
animationDuration: Duration(microseconds: 500),
animationCurve: Curves.bounceInOut,
index: 2,
onTap: (index){
debugPrint("current page is $index");
},)
    );
  }
}
