import 'package:firebase_auth/firebase_auth.dart';

import '../modelos/usuario_model.dart';


class AutenticacionService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UsuarioModel?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        return UsuarioModel(
          id: user.uid,
          email: user.email ?? '',
          password: '',
          name: '',
          image: null,
          isAdmin: false,
          isUser: false,
          phone: '',
        );
      }
    } catch (e) {
      print('Error during login: $e');
    }
    return null;
  }
}