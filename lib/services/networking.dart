import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  /// Méthode GET
  Future<dynamic> getData() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(
          "⚠️ Erreur lors de la récupération des données: ${response.statusCode}",
        );
        return null;
      }
    } catch (e) {
      print("❌ Exception lors du GET: $e");
      return null;
    }
  }

  /// Méthode POST
  Future<dynamic> postData(Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Retourne la réponse décodée
        return jsonDecode(response.body);
      } else {
        print("⚠️ Erreur lors de l'envoi des données: ${response.statusCode}");
        print("📩 Réponse: ${response.body}");
        return null;
      }
    } catch (e) {
      print("❌ Exception lors du POST: $e");
      return null;
    }
  }

  // Méthode DELETE
  Future<dynamic> deleteProduitPanier(int idProduit) async {
    try {
      final deleteUrl = Uri.parse('$url?id_produit=$idProduit');
      final response = await http.delete(deleteUrl);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(
          "⚠️ Erreur lors de la suppression des données: ${response.statusCode}",
        );
        return null;
      }
    } catch (e) {
      print("❌ Exception lors du DELETE: $e");
      return null;
    }
  }
}
