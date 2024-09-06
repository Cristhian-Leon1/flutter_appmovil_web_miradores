import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pueblito_viajero/provider/iniciar_sesion_provider.dart';
import 'package:pueblito_viajero/servicios/storage_service.dart';
import '../modelos/mirador_modelo.dart';
import '../provider/panel_mirador_provider.dart';

class RegistroMiradorService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final StorageService _storageService = StorageService();

  String documentId = '';

  Future<void> registrarMirador(BuildContext context, MiradorModel mirador) async {
    try {
      final sesionProvider = Provider.of<IniciarSesionProvider>(context, listen: false);
      final miradorProvider = Provider.of<PanelMiradorProvider>(context, listen: false);
      String userId = sesionProvider.usuario.id;

      await _guardarDatosMirador(userId, mirador);

      String? imageUrl;
      if (mirador.image != null) {
        imageUrl = await _storageService.uploadImage(documentId, mirador.image, 'mirador_images');
        miradorProvider.imagenUrl = imageUrl!;
      }

      List<String>? imageUrls = [];
      if (mirador.images != null) {
        imageUrls = (await _storageService.uploadImages(documentId, mirador.images, 'mirador_images')).cast<String>();
      }
      print(imageUrls);
      miradorProvider.imagenesUrl = imageUrls;


      await _firestore.collection('Miradores').doc(documentId).update({
        'image': imageUrl,
        'images': imageUrls,
      });

    } catch (e) {
      print('Error al registrar mirador: $e');
    }
  }

  Future<void> _guardarDatosMirador(String userId, MiradorModel mirador) async {
    try {
      DocumentReference docRef = await _firestore.collection('Miradores').add({
        'userId': userId,
        'name': mirador.name,
        'description': mirador.description,
        'address': mirador.address,
        'phone': mirador.phone,
        'email': mirador.email,
        'instagram': mirador.instagram,
        'facebook': mirador.facebook,
        'servicios': mirador.servicios,
        'hora': mirador.hora,
        'eventos': mirador.eventos.map((e) => e.toMap()).toList(),
      });

      documentId = docRef.id;
    } catch (e) {
      print('Error al guardar datos del mirador: $e');
    }
  }

  Future<String?> uploadImage(String userId, dynamic image, String carpeta) async {
    return await _storageService.uploadImage(userId, image, carpeta);
  }
}