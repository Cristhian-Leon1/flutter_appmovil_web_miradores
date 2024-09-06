import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../modelos/usuario_model.dart';
import '../servicios/autenticacion_service.dart';
import '../vistas/android/bienvenida/bienvenida_screen.dart';

class IniciarSesionProvider with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  bool isLoading = false;
  bool authProcess = false;
  bool isPasswordVisible = true;

  final AutenticacionService _autenticacionService = AutenticacionService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UsuarioModel usuario = UsuarioModel(
                          id: '',
                          email: '',
                          password: '',
                          name: '',
                          image: null,
                          isAdmin: false,
                          isUser: false,
                          phone: '',
                        );

  void agregarValor(TextEditingController controller, String tipo) {
    String valor = controller.text;
    if (valor.isNotEmpty) {
      switch (tipo) {
        case 'email':
          usuario.actualizarEmail(valor);
          break;
        case 'password':
          usuario.actualizarPassword(valor);
          break;
      }
      controller.clear();
    }
  }

  Future<void> login(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    UsuarioModel? user = await _autenticacionService.login(
      usuario.email,
      usuario.password,
    );

    if (user != null) {
      usuario = user;
      await fetchUserDataFromFirestore(user.id);
      isLoading = false;
      notifyListeners();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const BienvenidaPage()),
            (Route<dynamic> route) => false,
      );
    } else {
      print('Login failed');
    }
  }

  Future<void> fetchUserDataFromFirestore(String userId) async {
    try {
      DocumentSnapshot userDoc = await _firestore.collection('Usuarios').doc(userId).get();
      if (userDoc.exists) {
        usuario = UsuarioModel.fromMap(userDoc.data() as Map<String, dynamic>);
        usuario.id = userId;
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  void siguiente(BuildContext context) {
    Navigator.pushNamed(context, '/iniciar_contrasenia');
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void toggleAuthProcess() {
    authProcess = !authProcess;
    notifyListeners();
  }

  void toggleAuthProcessFalse() {
    authProcess = false;
    notifyListeners();
  }

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

}