class Produit {
  final int id_produit;
  final String name;
  final String urlImg;
  final String description;
  final double price;
  final int categoryId;

  Produit({
    required this.id_produit,
    required this.name,
    required this.urlImg,
    required this.description,
    required this.price,
    required this.categoryId,
  });

  factory Produit.fromJson(Map<String, dynamic> json) {
    return Produit(
      id_produit: _parseInt(json['id_produit']),
      name: json['nom_produit']?.toString() ?? '',
      urlImg: json['image_url']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      price: _parseDouble(json['prix']),
      categoryId: _parseInt(json['id_categorie']),
    );
  }

  static int _parseInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is String && value.isNotEmpty) {
      return int.tryParse(value) ?? 0;
    }
    return 0;
  }

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String && value.isNotEmpty) {
      return double.tryParse(value) ?? 0.0;
    }
    return 0.0;
  }
}
