import 'package:flutter/material.dart';
class MenuItem  extends StatelessWidget {
  final IconData icon;
  final String title;

  const MenuItem({Key key, this.icon, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children:[
          Icon(
            icon,
            color:Colors.cyan,
            size: 16,
          ),
          SizedBox(width: 16,),
          Text(title,style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 20,
            color: Colors.white
          ),)
        ],
      )
    );
  }
}
