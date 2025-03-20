import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../domain/models/trip_model.dart';
import '../widgets/trip_info.dart';
import '../../../../utils/custom_cache_manager.dart';

class TripDetailPage extends StatelessWidget {
  const TripDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final trip = ModalRoute.of(context)?.settings.arguments as TripModel?;

    if (trip == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Trip Not Found")),
        body: const Center(child: Text("No trip data available")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(trip.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: trip.imageUrl,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                child: CachedNetworkImage(
                  imageUrl: trip.imageUrl,
                  cacheManager: CustomCacheManager.instance,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.broken_image, size: 50),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TripInfo(trip: trip),
            ),
          ],
        ),
      ),
    );
  }
}
