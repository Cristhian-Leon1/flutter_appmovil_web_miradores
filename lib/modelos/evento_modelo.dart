class EventoModel {
  String nombre;
  double precio;
  String hora;
  String descripcion;
  dynamic image;

  EventoModel({
    required this.nombre,
    required this.precio,
    required this.hora,
    required this.descripcion,
    this.image,
  });

  factory EventoModel.fromMap(Map<String, dynamic> data) {
    return EventoModel(
      nombre: data['nombre'] ?? '',
      precio: data['precio']?.toDouble() ?? 0.0,
      hora: data['hora'] ?? '',
      descripcion: data['descripcion'] ?? '',
      image: data['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'precio': precio,
      'hora': hora,
      'descripcion': descripcion,
      'image': image,
    };
  }

  void actualizarNombre(String nombre) {
    this.nombre = nombre;
  }

  void actualizarPrecio(double precio) {
    this.precio = precio;
  }

  void actualizarHora(String hora) {
    this.hora = hora;
  }

  void actualizarDescripcion(String descripcion) {
    this.descripcion = descripcion;
  }

  void actualizarImagen(dynamic imagen) {
    this.image = imagen;
  }
}