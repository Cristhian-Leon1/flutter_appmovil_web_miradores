import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../servicios/mirador_service.dart';
import 'iniciar_sesion_provider.dart';

class OfertaLaboralProvider with ChangeNotifier {
  dynamic image;
  bool isLoading = false;
  List<String> _imageUrls = [];
  bool _isSliderLoading = true;
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<String> get imageUrls => _imageUrls;
  bool get isSliderLoading => _isSliderLoading;
  PageController get pageController => _pageController;

  OfertaLaboralProvider() {
    _fetchOfertasLaborales();
    _startAutoSlide();
  }

  void updateCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  Future<void> pickImageFromGallery() async {
    if (kIsWeb) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        image = await pickedFile.readAsBytes();
        notifyListeners();
      }
    } else if (Platform.isAndroid && await _isAndroid13OrAbove()) {
      final galleryStatus = await Permission.photos.request();
      if (galleryStatus.isGranted) {
        await _getImageFromGallery();
      } else {
        print('Permiso de galería no concedido.');
      }
    } else {
      final storageStatus = await Permission.storage.request();
      if (storageStatus.isGranted) {
        await _getImageFromGallery();
      } else {
        print('Permiso de almacenamiento no concedido.');
      }
    }
  }

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<bool> _isAndroid13OrAbove() async {
    final version = await Permission.photos.status;
    return version.isGranted;
  }

  Future<void> subirOfertaLaboral(BuildContext context) async {
    if (image == null) {
      print('No hay imagen seleccionada');
      return;
    }

    isLoading = true;
    notifyListeners();

    final sesionProvider = Provider.of<IniciarSesionProvider>(context, listen: false);
    final miradorService = MiradorService();

    try {
      String userId = sesionProvider.usuario.id;
      String? imageUrl = await miradorService.uploadImage(userId, image, 'ofertas_laborales_images');

      if (imageUrl != null) {
        await miradorService.guardarOfertaLaboral(userId, imageUrl);
        image = null;
        print('Oferta laboral subida exitosamente');
      } else {
        print('Error al subir la imagen');
      }
    } catch (e) {
      print('Error al subir oferta laboral: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _fetchOfertasLaborales() async {
    _isSliderLoading = true;
    notifyListeners();

    final miradorService = MiradorService();
    _imageUrls = await miradorService.obtenerOfertasLaborales();
    _isSliderLoading = false;
    notifyListeners();
  }

  void _startAutoSlide() {
    Future.delayed(const Duration(seconds: 10), () {
      if (_pageController.hasClients) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
        _startAutoSlide();
      }
    });
  }
}