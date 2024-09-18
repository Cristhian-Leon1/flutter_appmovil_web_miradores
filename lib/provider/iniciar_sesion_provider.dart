import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pueblito_viajero/modelos/mirador_modelo.dart';
import 'package:pueblito_viajero/vistas/web/sesion_registro/sesion_registro_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../modelos/usuario_model.dart';
import '../servicios/autenticacion_service.dart';
import '../vistas/android/bienvenida/bienvenida_screen.dart';
import '../vistas/android/iniciar_sesion/iniciar_sesion_screen.dart';
import 'fragmento_home_provider.dart';

class IniciarSesionProvider with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  bool isLoading = false;
  bool authProcess = false;
  bool tieneMirador = false;
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

  MiradorModel mirador = MiradorModel(
                          userId: '',
                          name: '',
                          description: '',
                          address: '',
                          phone: '',
                          email: '',
                          instagram: '',
                          facebook: '',
                          servicios: [],
                          hora: []
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

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userId', user.id);

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

  Future<void> logout(BuildContext context) async {
    await _autenticacionService.logout();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await prefs.remove('userId');
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    homeProvider.resetVariables();

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => kIsWeb ? const WebSesionRegistroScreen() :const IniciarSesionPage()),
          (Route<dynamic> route) => false,
    );
  }

  Future<void> fetchUserDataFromFirestore(String userId) async {
    try {
      DocumentSnapshot userDoc = await _firestore.collection('Usuarios').doc(userId).get();
      if (userDoc.exists) {
        usuario = UsuarioModel.fromMap(userDoc.data() as Map<String, dynamic>);
        usuario.id = userId;

        QuerySnapshot miradorQuery = await _firestore.collection('Miradores')
            .where('userId', isEqualTo: userId)
            .limit(1)
            .get();
        if (miradorQuery.docs.isNotEmpty) {
          tieneMirador = true;
          DocumentSnapshot miradorDoc = miradorQuery.docs.first;
          mirador = MiradorModel.fromMap(miradorDoc.data() as Map<String, dynamic>);
          mirador.userId = userId;
        }
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