import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

/// Classe utilitaire pour gérer l'authentification Google
class GoogleAuthService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );

  /// 🔹 Connexion via Google
  static Future<Map<String, dynamic>?> signInWithGoogle() async {
    try {
      // Ouvre la fenêtre de sélection de compte Google
      final GoogleSignInAccount? account = await _googleSignIn.signIn();

      if (account == null) {
        debugPrint('Connexion annulée par l’utilisateur');
        return null;
      }

      // Récupère le token d’authentification Google
      final GoogleSignInAuthentication auth = await account.authentication;
      final String? idToken = auth.idToken;

      if (idToken == null) {
        debugPrint('Impossible de récupérer le idToken Google');
        return null;
      }

      // ✅ Envoi du token au backend pour vérification et récupération JWT
      final backendResponse = await _sendTokenToBackend(idToken);

      if (backendResponse != null) {
        debugPrint('Authentification réussie ✅');
        return backendResponse;
      } else {
        debugPrint('Erreur lors de l’authentification avec le backend ❌');
        return null;
      }
    } catch (e) {
      debugPrint('Erreur Google Sign-In : $e');
      return null;
    }
  }

  /// 🔸 Déconnexion Google
  static Future<void> signOut() async {
    await _googleSignIn.signOut();
    debugPrint('Utilisateur déconnecté de Google');
  }

  /// 🔸 Envoi du token Google ID au backend
  static Future<Map<String, dynamic>?> _sendTokenToBackend(
    String idToken,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(
          'http://10.0.2.2:3000/api/auth/google',
        ), // ⚠️ remplace avec ton URL backend
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'token': idToken}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        debugPrint('Erreur backend: ${response.statusCode} - ${response.body}');
        return null;
      }
    } catch (e) {
      debugPrint('Erreur lors de l’envoi du token au backend: $e');
      return null;
    }
  }
}
