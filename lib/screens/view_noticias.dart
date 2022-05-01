import 'package:flutter/material.dart';

class ViewNoticiasRoute extends StatelessWidget {
  const ViewNoticiasRoute({
    Key? key,
    required this.titulo,
    required this.texto,
  }) : super(key: key);

  final String titulo;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        //automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(children: <Widget>[
          Card(
            color: Colors.deepOrange[300],
            elevation: 16,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Wrap(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(titulo, style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10))),
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  texto,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
