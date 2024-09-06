import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../provider/panel_mirador_provider.dart';
import '../fragmentos/secciones/imagenes_mirador.dart';

class ImagenesMiradorSeccionWrapper extends StatefulWidget {
  const ImagenesMiradorSeccionWrapper({super.key});

  @override
  _ImagenesMiradorSeccionWrapperState createState() => _ImagenesMiradorSeccionWrapperState();
}

class _ImagenesMiradorSeccionWrapperState extends State<ImagenesMiradorSeccionWrapper> {
  late PageController _pageController;
  late Timer _timer;
  final List<String> defaultImages = [
    'assets/imagen1.jpg',
    'assets/imagen2.jpg',
    'assets/imagen3.jpg',
    'assets/imagen4.jpg',
    'assets/imagen5.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    _timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      final provider = Provider.of<PanelMiradorProvider>(context, listen: false);
      final images = provider.mirador.images.isNotEmpty ? provider.mirador.images : defaultImages;
      int nextPage = provider.currentImageIndex < images.length - 1 ? provider.currentImageIndex + 1 : 0;
      provider.actualizarImagen(nextPage);

      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PanelMiradorProvider>(context);
    final images = provider.mirador.images.isNotEmpty ? provider.mirador.images : defaultImages;

    return ImagenesMiradorSeccion(
      pageController: _pageController,
      images: images,
    );
  }
}