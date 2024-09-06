import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../provider/panel_mirador_provider.dart';
import '../../widgets/editar.dart';
import 'dart:typed_data';

class ImagenesMiradorSeccion extends StatelessWidget {
  final PageController pageController;
  final List<dynamic> images;

  const ImagenesMiradorSeccion({
    required this.pageController,
    required this.images,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final miradorProvider = Provider.of<PanelMiradorProvider>(context);

    return Card(
      elevation: 3,
      color: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: PageView.builder(
                  controller: pageController,
                  itemCount: images.length,
                  onPageChanged: (index) {
                    miradorProvider.actualizarImagen(index);
                  },
                  itemBuilder: (context, index) {
                    final image = images[index];
                    return image is String && image.startsWith('assets/')
                    ? Image.asset(
                      image,
                      fit: BoxFit.cover,
                    )
                    : Image.memory(
                      image,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 7,
              right: 10,
              child: EditarWidgetEliminar(
                id: 2,
                onEdit: () {
                  miradorProvider.pickImagesFromGallery();
                },
                onDelete: () {
                  miradorProvider.deleteAllImages();
                },
                onCheck: () {
                  miradorProvider.cambiarMarcaImagenes();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
