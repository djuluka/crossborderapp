class Commodities {
  int id;
  String hs;
  String description;
  String descriptionComercial;
  String price;
  String paises;

  Commodities(
      {required this.id,
      required this.hs,
      required this.description,
      required this.price,
      required this.descriptionComercial,
      required this.paises});

  factory Commodities.fromJson(Map<String, dynamic> json) {
    return Commodities(
      id: json["id"] as int,
      hs: json["hs"] as String,
      description: json["description"] as String,
      descriptionComercial: json["descriptionComercial"] as String,
      price: json["price"] as String,
      paises: json["paises"] as String,
    );
  }
}
