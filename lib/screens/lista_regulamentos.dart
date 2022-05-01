import 'package:flutter/material.dart';

class ListaRegulamentos extends StatelessWidget {
  const ListaRegulamentos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista Regulamentos'),
        //automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.new_label,
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
      body: Center(
        child: Text("List ListaRegulamentos"),
      ),
    );
  }
}
