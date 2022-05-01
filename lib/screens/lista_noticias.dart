import 'dart:async';
import 'dart:convert';

import 'package:crossborderapp/screens/commoditiesInfo.dart';
import 'package:crossborderapp/screens/view_noticias.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/commodities.dart';

class ListaNoticias extends StatefulWidget {
  @override
  _ListaNoticiasState createState() => _ListaNoticiasState();
}

class _ListaNoticiasState extends State<ListaNoticias> {
  Future<List> _loadData() async {
    List comm = [];
    try {
      // This is an open REST API endpoint for testing purposes
      const API = 'http://localhost:3000/noticias';

      final http.Response response = await http.get(Uri.parse(API));
      comm = json.decode(response.body);
    } catch (err) {
      print(err);
    }

    return comm;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista Noticias"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.find_replace_sharp,
                color: Colors.white,
              ),
              onPressed: () {
                /* Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                );*/
              },
            )
          ],
        ),
        body: FutureBuilder(
            future: _loadData(),
            builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, index) => Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            leading:
                                _thumbnail(snapshot.data![index]['imagem']),
                            title: Text(
                              snapshot.data![index]['titulo'],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.justify,
                            ),
                            subtitle: Text(
                              snapshot.data![index]['resumo'],
                              textAlign: TextAlign.justify,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewNoticiasRoute(
                                          titulo: snapshot.data![index]
                                              ['titulo'],
                                          texto: snapshot.data![index]['texto'],
                                        )),
                              );
                            },
                          ),
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      )));
  }
}

Widget _thumbnail(String url) {
  return Container(
      constraints: BoxConstraints.tightFor(width: 80.0),
      child: Image.network(
        url,
        fit: BoxFit.fitWidth,
      ));
}

// passing data
