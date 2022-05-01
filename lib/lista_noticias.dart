import 'package:flutter/material.dart';

class ListaCommodoties extends StatelessWidget {
  const ListaCommodoties({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ultimas Noticias'),
        //automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text("Lista Commodities"),
      ),
    );
  }
}
