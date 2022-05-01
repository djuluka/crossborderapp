import 'package:flutter/material.dart';

class ListaCommodoties extends StatelessWidget {
  const ListaCommodoties({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Regulamentos'),
        //automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text("List Regulamentos"),
      ),
    );
  }
}
