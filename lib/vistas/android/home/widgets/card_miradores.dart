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
          height: 180,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
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
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const InteractiveStars(),
                  const InteractiveFavorite(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InteractiveStars extends StatefulWidget {
  const InteractiveStars({super.key});

  @override
  _InteractiveStarsState createState() => _InteractiveStarsState();
}

class _InteractiveStarsState extends State<InteractiveStars> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 20,
          ),
          onPressed: () {
            setState(() {
              _rating = index + 1;
            });
          },
        );
      }),
    );
  }
}

class InteractiveFavorite extends StatefulWidget {
  const InteractiveFavorite({super.key});

  @override
  _InteractiveFavoriteState createState() => _InteractiveFavoriteState();
}

class _InteractiveFavoriteState extends State<InteractiveFavorite> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
      },
    );
  }
}