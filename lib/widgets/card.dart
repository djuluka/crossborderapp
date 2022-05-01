import 'package:flutter/material.dart';

import '../screens/Settings.dart';

class MyCard extends StatelessWidget {
  MyCard(
      {required this.title,
      required this.icon,
      required this.color,
      required this.link});

  final String title;
  final IconData icon;
  final MaterialColor color;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 4.0,
      child: InkWell(
        onTap: () {
          /* Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Settings()),
          );*/
          Navigator.pushNamed(context, link,
              arguments: {"id": 2, "name": "Nokia"});
        },
        splashColor: Colors.green,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                size: 50,
                color: color,
              ),
              Text(
                title,
                style: new TextStyle(fontSize: 17.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
