import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;

/// Classe qui gère l'authentification Facebook
class FacebookAuthService {
  /// Connexion via Facebook
  Future<Map<String, dynamic>?> signInWithFacebook() async {
    try {
      // Étape 1 : Démarre le flux de connexion
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
      );

      switch (result.status) {
        case LoginStatus.success:
          // Étape 2 : Récupère le token Facebook
          final AccessToken accessToken = result.accessToken!;
          debugPrint('✅ Facebook Access Token: ${accessToken.tokenString}');

          // Étape 3 : Optionnel — Récupère les infos de l’utilisateur
          final userData = await FacebookAuth.instance.getUserData(
            fields: "email,name,picture.width(200)",
          );
          debugPrint('👤 Facebook user data: $userData');

          // Étape 4 : Envoie le token au backend pour créer une session
          await _sendTokenToBackend(accessToken.tokenString);

          return userData;

        case LoginStatus.cancelled:
          debugPrint('⚠️ Connexion Facebook annulée par l’utilisateur.');
          return null;

        case LoginStatus.failed:
          debugPrint('❌ Erreur Facebook: ${result.message}');
          return null;

        default:
          debugPrint('❌ Statut inconnu: ${result.status}');
          return null;
      }
    } catch (e) {
      debugPrint('Erreur lors de la connexion Facebook: $e');
    }
  }

  /// Déconnexion Facebook
  Future<Map<String, dynamic>?> signOutFromFacebook() async {
    await FacebookAuth.instance.logOut();
    debugPrint('🚪 Déconnecté de Facebook');
  }

  /// Exemple d’envoi du token au backend
  Future<void> _sendTokenToBackend(String token) async {
    try {
      final response = await http.post(
        Uri.parse('https://ton-backend.com/api/auth/facebook'),
        body: {'token': token},
      );

      if (response.statusCode == 200) {
        debugPrint('✅ Utilisateur authentifié via Facebook');
        // 👉 ici tu peux stocker le JWT reçu dans les préférences locales
      } else {
        debugPrint('❌ Erreur backend Facebook: ${response.body}');
      }
    } catch (e) {
      debugPrint('❌ Erreur requête backend Facebook: $e');
    }
  }
}
