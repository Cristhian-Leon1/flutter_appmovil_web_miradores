import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class OfertaLaboralProvider with ChangeNotifier {
  dynamic image;

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
}