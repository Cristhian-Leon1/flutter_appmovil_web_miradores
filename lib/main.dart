import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:pueblito_viajero/provider/panel_eventos_provider.dart';
import 'package:pueblito_viajero/provider/iniciar_sesion_provider.dart';
import 'package:pueblito_viajero/provider/panel_inicio_provider.dart';
import 'package:pueblito_viajero/provider/panel_mirador_provider.dart';
import 'package:pueblito_viajero/provider/panel_oferta_laboral_provider.dart';
import 'package:pueblito_viajero/provider/panel_perfil_provider.dart';
import 'package:pueblito_viajero/provider/registro_provider.dart';
import 'package:pueblito_viajero/provider/servicios_provider.dart';
import 'package:pueblito_viajero/provider/start_provider.dart';
import 'package:pueblito_viajero/vistas/android/bienvenida/bienvenida_screen.dart';
import 'package:pueblito_viajero/vistas/android/crear_cuenta/cargar_imagen_screen.dart';
import 'package:pueblito_viajero/vistas/android/crear_cuenta/crear_cuenta_1_screen.dart';
import 'package:pueblito_viajero/vistas/android/crear_cuenta/crear_cuenta_2_screen.dart';
import 'package:pueblito_viajero/vistas/android/home/home_screen.dart';
import 'package:pueblito_viajero/vistas/android/informacion/informacion_screen.dart';
import 'package:pueblito_viajero/vistas/android/iniciar_sesion/iniciar_sesion_contrasenia_escreen.dart';
import 'package:pueblito_viajero/vistas/android/iniciar_sesion/iniciar_sesion_screen.dart';
import 'package:pueblito_viajero/vistas/android/servicios/servicios_screen.dart';
import 'package:pueblito_viajero/vistas/android/splash/splash_screen.dart';
import 'package:pueblito_viajero/vistas/android/start/start_screen.dart';
import 'package:pueblito_viajero/vistas/web/panel_screen/panel_screen.dart';
import 'package:pueblito_viajero/vistas/web/sesion_registro/sesion_registro_screen.dart';

import 'servicios/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      FlutterStatusbarcolor.setStatusBarColor(Colors.white);
      FlutterStatusbarcolor.setNavigationBarColor(Colors.transparent);

      SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual,
          overlays: [SystemUiOverlay.top]
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StartProvider>(
          create: (_) => StartProvider(),
        ),
        ChangeNotifierProvider<RegistroProvider>(
          create: (_) => RegistroProvider(),
        ),
        ChangeNotifierProvider<IniciarSesionProvider>(
          create: (_) => IniciarSesionProvider(),
        ),
        ChangeNotifierProvider<ServiciosProvider>(
          create: (_) => ServiciosProvider(),
        ),
        ChangeNotifierProvider<PanelProvider>(
          create: (_) => PanelProvider(),
        ),
        ChangeNotifierProvider<EventosProvider>(
          create: (_) => EventosProvider(),
        ),
        ChangeNotifierProvider<PanelMiradorProvider>(
          create: (_) => PanelMiradorProvider(),
        ),
        ChangeNotifierProvider<OfertaLaboralProvider>(
          create: (_) => OfertaLaboralProvider(),
        ),
        ChangeNotifierProvider<PerfilProvider>(
          create: (_) => PerfilProvider(),
        ),
      ],
      child: const MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  const MaterialAppWithTheme({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: kIsWeb ? '/web_sesion_registro' : '/splash',
      routes: <String, WidgetBuilder>{
        '/splash': (context) => const SplashPage(),
        '/start': (context) => const StartPage(),
        '/informacion': (context) => const InformationPage(),
        '/servicios': (context) => const ServicesPage(),
        '/iniciar_sesion': (context) => const IniciarSesionPage(),
        '/iniciar_contrasenia': (context) => const IniciarContraseniaPage(),
        '/crear_cuenta': (context) => const CrearCuentaPage(),
        '/crear_cuenta_2': (context) => const CrearCuenta2Page(),
        '/cargar_imagen': (context) => const UploadImagePage(),
        '/bienvenida': (context) => const BienvenidaPage(),
        '/home': (context) => const HomePage(),

        '/web_sesion_registro': (context) => const WebSesionRegistroScreen(),
        '/panel_administrativo': (context) => const PanelScreen(),
      },
    );
  }
}

