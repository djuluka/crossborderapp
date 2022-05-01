import 'package:flutter/material.dart';

import '../models/commodities.dart';

class CommoditiesInfo extends StatelessWidget {
  const CommoditiesInfo(
      {Key? key,
      required this.hs,
      required this.description,
      required this.comercialDescription,
      required this.price,
      required this.paises,
      required this.obs})
      : super(key: key);
  final String hs;
  final String description;
  final String comercialDescription;
  final int price;
  final String paises;
  final String obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(comercialDescription),
        //automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Card(
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
                    Text("SH (Sistema Harmonizado)",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(hs, style: TextStyle(fontSize: 18)),
                    Text("Descrisāo do SH ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(
                      description,
                    ),
                    Text("Descrisāo Comercial",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(
                      comercialDescription,
                    ),
                    Divider(
                      color: Colors.black,
                      height: 36,
                    ),
                    Text("Preço Medio",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("XOF " + price.toString()),
                    //style: TextStyle(fontSize: 18)),
                    Divider(
                      color: Colors.black,
                      height: 36,
                    ),
                    Text("Paises Exports",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(
                      paises,
                      // style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.justify,
                    ),
                    Divider(
                      color: Colors.black,
                      height: 36,
                    ),
                    Text("Observacoes",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(
                      obs,
                      // style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
