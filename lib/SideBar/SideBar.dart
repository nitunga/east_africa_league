import 'dart:async';

import 'package:eastafricaleague/SideBar/menuContent.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}
class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSideBarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animatedDuration=const Duration(milliseconds: 500);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController=AnimationController(vsync: this,duration: _animatedDuration);
    isSidebarOpenedStreamController=PublishSubject<bool>();
    isSideBarOpenedStream=isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink=isSidebarOpenedStreamController.sink;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
  isSidebarOpenedStreamController.close();
  isSidebarOpenedSink.close();
    super.dispose();
  }
  void  onIconPressed(){
    final animatedStatus =_animationController.status;
    final isAnimationCompleted= animatedStatus == AnimationStatus.completed;
    if(isAnimationCompleted){
      isSidebarOpenedSink.add(false);
     _animationController.reverse();
    }else{
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ScreenWidth=MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSideBarOpenedStream ,
      builder: (context,isSideBarOpenedAsync){
        return  AnimatedPositioned(
          duration: _animatedDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -ScreenWidth,
          right: isSideBarOpenedAsync.data ? 0:ScreenWidth - 45,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding:const  EdgeInsets.symmetric(horizontal: 10),
                  color: Color(0xFF262AAA),
          child: Column(
            children:[
              SizedBox(height: 100,),
              ListTile(
                title:Text("Ligi kuu",style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w800),) ,
                subtitle: Text("Tanzania ligi kuu ",style: TextStyle(
                  color: Color(0xFF1BB5FD),fontSize: 16,fontWeight: FontWeight.w800
                ),
                ),
                leading: CircleAvatar(
                  child: Icon(
                    Icons.perm_identity,
                    color: Colors.white,
                  ),
                  radius: 40,
                ),
              ),
              Divider(
                height: 64,
                thickness: 0.5,
                color: Colors.white,
                indent: 32,
                endIndent:32,
              ),
             MenuItem(
               icon:Icons.live_tv ,
               title: "Live matches",
             ),
              MenuItem(
               icon:Icons.settings ,
               title: "Setting",
             ),
              MenuItem(
               icon:Icons.folder_open ,
               title: "News",
             ),
              MenuItem(
               icon:Icons.contacts,
               title: "Contact US",
             ),
            ],
          ),
                  ),
                ),
              Align(
                alignment: Alignment(0,-0.9),
                child:GestureDetector(
                  onTap:()  {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper:CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color:  Color(0xFF262AAA),
                      alignment:Alignment.centerLeft,
                      child: AnimatedIcon(
                          icon: AnimatedIcons.menu_close,
                          progress:_animationController.view,
                          color:Color(0xFF1BB5FD),
                          size:25
                      ),

                    ),
                  ),
                ) ,
              )

            ],),

        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Paint paint=Paint();
    paint.color=Colors.white;
    final width=size.width;
    final height=size.height;
    Path path=Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width-1, height/2 -20 ,width,height/2);
    path.quadraticBezierTo(width+1, height/2 +20 ,10 ,height - 16);
    path.quadraticBezierTo(0, height-8 ,0 ,height);
    path.close();
    // TODO: implement getClip
  return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper){
    return true;
  }
}

