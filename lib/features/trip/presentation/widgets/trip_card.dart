import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../pages/trip_detail_page.dart';
import '../../domain/models/trip_model.dart';

class TripCard extends StatelessWidget {
  final TripModel trip;

  const TripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 3,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12.0),
        leading: Hero(
          tag: trip.imageUrl,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              imageUrl: trip.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.broken_image, size: 50),
            ),
          ),
        ),
        title: Text(
          trip.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _formatPrice(trip.price),
              style: const TextStyle(color: Colors.blueAccent),
            ),
            _buildRating(trip.rating),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TripDetailPage(),
              settings: RouteSettings(arguments: trip),
            ),
          );
        },
      ),
    );
  }

  // Fungsi untuk formatting harga dengan mata uang
  String _formatPrice(double price) {
    return "Rp ${price.toStringAsFixed(0)}";
  }

  // Widget untuk menampilkan rating dengan ikon bintang
  Widget _buildRating(double rating) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 18),
        const SizedBox(width: 4),
        Text(rating.toString()),
      ],
    );
  }
}
