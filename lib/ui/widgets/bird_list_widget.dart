import 'package:flutter/material.dart';
import 'package:horus/models/birds.dart';
import 'constants.dart';

const kTextStyle = TextStyle(
  fontSize: 15,
  color: kPrimaryColor,
);

class BirdListWidget extends StatelessWidget {
  final Bird bird;

  const BirdListWidget({super.key, required this.bird});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Row(
        children: <Widget>[
          // --- Image Section ---
          Container(
            padding: const EdgeInsets.all(8),
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.8),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Hero(
              tag: bird.commonName,
              child: Image.asset(
                'assets/images/${bird.imageUrl}',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 40),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // --- Text Info Section ---
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    bird.commonName,
                    style: kTextStyle.copyWith(fontWeight: FontWeight.w800),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    bird.scientificName,
                    style: kTextStyle.copyWith(fontStyle: FontStyle.italic),
                    softWrap: true,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Habitat: ${bird.habitat}",
                    style: kTextStyle,
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
