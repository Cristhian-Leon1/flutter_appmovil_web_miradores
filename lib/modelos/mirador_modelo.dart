import 'evento_modelo.dart';

class MiradorModel {
  String userId;
  String name;
  String description;
  dynamic image;
  List<dynamic> images;
  String address;
  String phone;
  String email;
  String instagram;
  String facebook;
  List<String?> servicios;
  List<String?> hora;

  MiradorModel({
    required this.userId,
    required this.name,
    required this.description,
    this.image,
    this.images = const [],
    required this.address,
    required this.phone,
    required this.email,
    required this.instagram,
    required this.facebook,
    required this.servicios,
    required this.hora,
  });

  factory MiradorModel.fromMap(Map<String, dynamic> data) {
    return MiradorModel(
      userId: data['userId'] ?? '',
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      image: data['image'],
      images: data['images'] ?? [],
      address: data['address'] ?? '',
      phone: data['phone'] ?? '',
      email: data['email'] ?? '',
      instagram: data['instagram'] ?? '',
      facebook: data['facebook'] ?? '',
      servicios: List<String>.from(data['servicios'] ?? []),
      hora: List<String>.from(data['hora'] ?? ['', '']),
    );
  }

  void actualizarNombre(String name) {
    this.name = name;
  }

  void actualizarDescripcion(String description) {
    this.description = description;
  }

  void actualizarImagen(dynamic image) {
    this.image = image;
  }

  void actualizarImagenes(List<dynamic> images) {
    this.images = images;
  }

  void actualizarDireccion(String address) {
    this.address = address;
  }

  void actualizarTelefono(String phone) {
    this.phone = phone;
  }

  void actualizarEmail(String email) {
    this.email = email;
  }

  void actualizarInstagram(String instagram) {
    this.instagram = instagram;
  }

  void actualizarFacebook(String facebook) {
    this.facebook = facebook;
  }

  void actualizarServicios(List<String> servicios) {
    this.servicios = servicios;
  }

  void actualizarHora(List<String> hora) {
    this.hora = hora;
  }

  @override
  String toString() {
    return 'MiradorModel(userId: $userId, name: $name, description: $description, address: $address, phone: $phone, email: $email, instagram: $instagram, facebook: $facebook, servicios: $servicios, hora: $hora, image: $image, images: $images)';
  }
}