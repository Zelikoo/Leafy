import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) return;

    if (defaultTargetPlatform == TargetPlatform.android) {
      await _googleSignIn.initialize(
        // Android n’a pas besoin de clientId
        serverClientId:
            "307123541227-kkp9tvjqb73a8ie22jcpkdbqegj22879.apps.googleusercontent.com",
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      await _googleSignIn.initialize();
    } else if (kIsWeb) {
      await _googleSignIn.initialize(
        clientId:
            "307123541227-kkp9tvjqb73a8ie22jcpkdbqegj22879.apps.googleusercontent.com",
      );
    }

    _initialized = true;
  }

  Future<GoogleSignInAccount?> signIn() async {
    // S’assurer que tout est initialisé
    if (!_initialized) {
      await initialize();
    }
    // Pour les plateformes qui supportent `authenticate`
    if (_googleSignIn.supportsAuthenticate()) {
      return await _googleSignIn.authenticate();
    } else {
      // fallback pour les plateformes qui ne supportent pas `authenticate`
      // (par exemple, web pourrait avoir son propre flow)
      throw UnimplementedError(
        'authenticate non supporté sur cette plateforme',
      );
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }

  Future<GoogleSignInAccount?> trySilentSignIn() async {
    if (!_initialized) {
      await initialize();
    }
    return await _googleSignIn.attemptLightweightAuthentication();
  }
}
