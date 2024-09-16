import 'package:flutter/material.dart';
import '../../../../modelos/mirador_modelo.dart';
class CardMirador extends StatelessWidget {
  final MiradorModel mirador;

  const CardMirador({required this.mirador, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 7),
      child: Card(
        color: Colors.grey[300],
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: double.infinity,
          height: 170,
          padding: const EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(mirador.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      mirador.name,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      mirador.description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: List.generate(5, (index) {
                            return const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            );
                          }),
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}