import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/models/trip_model.dart';

final formatCurrency =
    NumberFormat.currency(locale: 'id_ID', symbol: 'IDR ', decimalDigits: 0);

class TripInfo extends StatelessWidget {
  final TripModel trip;

  const TripInfo({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              trip.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 20),
                Text(
                  " ${trip.rating} (${trip.reviewCount} reviews)",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Divider(),
            const Text(
              "Description:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(trip.summary, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 12),
            Row(
              children: [
                if (trip.originalPrice > trip.price)
                  Text(
                    formatCurrency.format(trip.originalPrice),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.red,
                      decorationThickness: 2,
                    ),
                  ),
                const SizedBox(width: 8),
                Text(
                  formatCurrency.format(trip.price),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Icon(Icons.person, size: 20),
                const SizedBox(width: 4),
                Text(
                  "Passengers: ${trip.passengers}",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Divider(),
            _buildSection(
                "Includes:", trip.includes, Icons.check, Colors.green),
            _buildSection("Excludes:", trip.excludes, Icons.close, Colors.red),
            const Divider(),
            const Text(
              "Terms & Conditions:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(trip.terms, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      String title, List<String> items, IconData icon, Color iconColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ...items.map(
          (item) => Row(
            children: [
              Icon(icon, size: 16, color: iconColor),
              const SizedBox(width: 4),
              Expanded(child: Text(item, style: const TextStyle(fontSize: 16))),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
