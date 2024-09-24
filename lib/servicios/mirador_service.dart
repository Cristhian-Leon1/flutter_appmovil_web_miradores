import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pueblito_viajero/provider/iniciar_sesion_provider.dart';
import 'package:pueblito_viajero/servicios/storage_service.dart';
import '../modelos/evento_modelo.dart';
import '../modelos/mirador_modelo.dart';
import '../modelos/oferta_laboral_modelo.dart';
import '../provider/panel_mirador_provider.dart';

class MiradorService {
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
      });

      documentId = docRef.id;
    } catch (e) {
      print('Error al guardar datos del mirador: $e');
    }
  }

  Future<String?> uploadImage(String userId, dynamic image, String carpeta) async {
    return await _storageService.uploadImage(userId, image, carpeta);
  }

  Future<void> actualizarMirador(BuildContext context) async {
    final sesionProvider = Provider.of<IniciarSesionProvider>(context, listen: false);
    final miradorProvider = Provider.of<PanelMiradorProvider>(context, listen: false);
    try {
      QuerySnapshot query = await _firestore.collection('Miradores')
          .where('userId', isEqualTo: sesionProvider.mirador.userId)
          .limit(1)
          .get();

      if (query.docs.isNotEmpty) {
        DocumentReference docRef = query.docs.first.reference;

        await docRef.update({
          'name': miradorProvider.mirador.name,
          'description': miradorProvider.mirador.description,
          'address': miradorProvider.mirador.address,
          'phone': miradorProvider.mirador.phone,
          'email': miradorProvider.mirador.email,
          'instagram': miradorProvider.mirador.instagram,
          'facebook': miradorProvider.mirador.facebook,
          'servicios': miradorProvider.mirador.servicios,
          'hora': miradorProvider.mirador.hora,
        });

        if (miradorProvider.mirador.image != null) {
          String? imageUrl = await _storageService.uploadImage(docRef.id, miradorProvider.mirador.image, 'mirador_images');
          await docRef.update({'image': imageUrl});
        }

        if (miradorProvider.mirador.images != null) {
          List<String>? imageUrls = (await _storageService.uploadImages(docRef.id, miradorProvider.mirador.images, 'mirador_images')).cast<String>();
          await docRef.update({'images': imageUrls});
        }
      }
    } catch (e) {
      print('Error al actualizar mirador: $e');
    }
  }

  Future<void> actualizarEvento(String userId, EventoModel evento) async {
    try {
      String? imageUrl;
      if (evento.image != null) {
        imageUrl = await _storageService.uploadImage(userId, evento.image, 'event_images');
        evento.actualizarImagen(imageUrl);
      }

      await _firestore.collection('Eventos').add({
        'userId': userId,
        'nombre': evento.nombre,
        'precio': evento.precio,
        'hora': evento.hora,
        'descripcion': evento.descripcion,
        'image': imageUrl,
        'fecha': evento.fecha?.toIso8601String(), // Asegurarse de guardar la fecha
      });
    } catch (e) {
      print('Error al actualizar evento: $e');
    }
  }

  Future<void> guardarOfertaLaboral(OfertaLaboralModel ofertaLaboral) async {
    try {
      QuerySnapshot query = await _firestore.collection('OfertasLaborales')
          .where('userId', isEqualTo: ofertaLaboral.userId)
          .limit(1)
          .get();

      if (query.docs.isEmpty) {
        await _firestore.collection('OfertasLaborales').add(ofertaLaboral.toMap());
      } else {
        print('Ya existe una oferta laboral para este usuario');
      }
    } catch (e) {
      print('Error al guardar oferta laboral: $e');
    }
  }

  Future<List<String>> obtenerOfertasLaborales(String userId) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('OfertasLaborales')
          .where('userId', isEqualTo: userId)
          .get();
      List<String> imageUrls = querySnapshot.docs.map((doc) => doc['imageUrl'] as String).toList();
      return imageUrls;
    } catch (e) {
      print('Error al obtener ofertas laborales: $e');
      return [];
    }
  }

  Future<void> eliminarOfertaLaboral(String userId) async {
    try {
      QuerySnapshot query = await _firestore.collection('OfertasLaborales')
          .where('userId', isEqualTo: userId)
          .get();

      for (var doc in query.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      print('Error al eliminar oferta laboral: $e');
    }
  }

  Future<List<MiradorModel>> obtenerMiradores() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('Miradores').get();
      return querySnapshot.docs.map((doc) => MiradorModel.fromMap(doc.data() as Map<String, dynamic>, doc.id)).toList();
    } catch (e) {
      print('Error al obtener miradores: $e');
      return [];
    }
  }

  Future<List<MiradorModel>> buscarMiradoresPorNombre(String nombre) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('Miradores').get();
      String nombreLower = nombre.toLowerCase();
      return querySnapshot.docs
          .map((doc) => MiradorModel.fromMap(doc.data() as Map<String, dynamic>, doc.id)) // Incluir el ID del documento
          .where((mirador) => mirador.name.toLowerCase().contains(nombreLower))
          .toList();
    } catch (e) {
      print('Error al buscar miradores: $e');
      return [];
    }
  }

  Future<void> actualizarFavoritos(String miradorId, String userId) async {
    try {
      DocumentReference docRef = _firestore.collection('Miradores').doc(miradorId);
      await docRef.update({
        'favoritos': FieldValue.arrayUnion([userId]),
      });
    } catch (e) {
      print('Error al actualizar favoritos: $e');
    }
  }

  Future<void> eliminarFavorito(String miradorId, String userId) async {
    try {
      DocumentReference docRef = _firestore.collection('Miradores').doc(miradorId);
      await docRef.update({
        'favoritos': FieldValue.arrayRemove([userId]),
      });
    } catch (e) {
      print('Error al eliminar favorito: $e');
    }
  }

  Future<void> agregarCalificacion(String miradorId, String userId, int calificacion) async {
    try {
      DocumentReference docRef = _firestore.collection('Miradores').doc(miradorId);
      await docRef.update({
        'calificaciones.$userId': calificacion,
      });
    } catch (e) {
      print('Error al agregar calificación: $e');
    }
  }

  Future<List<EventoModel>> obtenerEventos() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('Eventos').get();
      return querySnapshot.docs.map((doc) => EventoModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      print('Error al obtener eventos: $e');
      return [];
    }
  }
}