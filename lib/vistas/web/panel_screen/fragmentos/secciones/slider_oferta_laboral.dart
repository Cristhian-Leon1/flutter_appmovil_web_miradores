import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../provider/panel_oferta_laboral_provider.dart';

class SliderOfertaLaboral extends StatelessWidget {
  const SliderOfertaLaboral({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OfertaLaboralProvider>(context);

    return Card(
      elevation: 3,
      color: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 4.0),
                borderRadius: BorderRadius.circular(15),
              ),
              child: PageView.builder(
                controller: provider.pageController,
                itemCount: provider.imageUrls.length,
                itemBuilder: (context, index) {
                  final imageUrl = provider.imageUrls[index];

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                },
                onPageChanged: (index) {
                  provider.updateCurrentPage(index);
                },
              ),
            ),
          ),
          if (provider.isSliderLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}