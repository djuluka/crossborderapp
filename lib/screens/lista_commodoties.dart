import 'dart:async';
import 'dart:convert';

import 'package:crossborderapp/screens/commoditiesInfo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/commodities.dart';

class ListaCommodoties extends StatefulWidget {
  @override
  _ListaCommodotiesState createState() => _ListaCommodotiesState();
}

class _ListaCommodotiesState extends State<ListaCommodoties> {
  Future<List> _loadData() async {
    List comm = [];
    try {
      // This is an open REST API endpoint for testing purposes
      const API = 'http://localhost:3000/commodities';

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
          title: Text("Lista Commodities"),
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
                        itemBuilder: (BuildContext context, index) {
                          var treeChar = snapshot.data![index]['description']
                              .substring(0, 3)
                              .toUpperCase();
                          return Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(10),
                              leading: CircleAvatar(
                                backgroundColor: Colors.greenAccent[400],
                                child: Text(
                                  treeChar,
                                  style: TextStyle(
                                      fontSize: 15,
                                      //  color: index % 2 == 0
                                      //    ? Colors.red
                                      //  : Colors.deepOrange[400],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              title: Text(
                                snapshot.data![index]['hs'],
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                              subtitle: Text(
                                  snapshot.data![index]['description'],
                                  style: TextStyle(color: Colors.blue[450]),
                                  textAlign: TextAlign.justify),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CommoditiesInfo(
                                            hs: snapshot.data![index]['hs'],
                                            description: snapshot.data![index]
                                                ['description'],
                                            comercialDescription:
                                                snapshot.data![index]
                                                    ['descriptionComercial'],
                                            price: snapshot.data![index]
                                                ['price'],
                                            paises: snapshot.data![index]
                                                ['paises'],
                                            obs: snapshot.data![index]['obs'],
                                          )),
                                );
                              },
                            ),
                          );
                        })
                    : Center(
                        child: CircularProgressIndicator(),
                      )));
  }
}

// passing data
