import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../trip/presentation/pages/trip_detail_page.dart';
import '../../../trip/presentation/providers/trip_provider.dart';
import '../../../trip/domain/models/trip_model.dart';
import '../../../../utils/custom_cache_manager.dart';

final formatCurrency =
    NumberFormat.currency(locale: 'id_ID', symbol: 'IDR ', decimalDigits: 0);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Banner Image
                SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://drive.google.com/uc?export=view&id=1ub1GfXekxUwGeRXGs-johdhACybAVI_i',
                    cacheManager: CustomCacheManager.instance,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.broken_image, size: 50),
                  ),
                ),

                // Search Bar
                Positioned(
                  top: 100,
                  left: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.grey),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            onChanged: (value) {
                              setState(() {
                                searchQuery = value.toLowerCase();
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "Search trip...",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        if (_searchController.text.isNotEmpty)
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.grey),
                            onPressed: () {
                              _searchController.clear();
                              setState(() {
                                searchQuery = "";
                              });
                            },
                          ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  bottom: 40,
                  left: 16,
                  child: Text(
                    "Hey you, where are you going?",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                "Recommended Trips",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 260,
              child: Consumer<TripProvider>(
                builder: (context, tripProvider, child) {
                  if (tripProvider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  List<TripModel> filteredTrips = tripProvider.trips
                      .where((trip) =>
                          trip.title.toLowerCase().contains(searchQuery) ||
                          trip.location.toLowerCase().contains(searchQuery))
                      .toList();

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filteredTrips.length,
                    itemBuilder: (context, index) {
                      final trip = filteredTrips[index];
                      return _tripCard(trip, context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tripCard(TripModel trip, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TripDetailPage(),
            settings: RouteSettings(arguments: trip),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 8, bottom: 10),
        child: Container(
          width: 180,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: trip.imageUrl,
                  cacheManager: CustomCacheManager.instance,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.broken_image, size: 50),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trip.title,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    _buildStars(trip.rating),
                    const SizedBox(height: 2),
                    Text(
                      trip.location,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          "${trip.rating}/5",
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "(${trip.reviewCount} Review)",
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formatCurrency.format(trip.originalPrice),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.red,
                            decorationThickness: 2,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          formatCurrency.format(trip.price),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
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

  Widget _buildStars(double rating) {
    return Row(
      children: List.generate(
            rating.floor(),
            (index) => const Icon(Icons.star, color: Colors.amber, size: 14),
          ) +
          (rating % 1 >= 0.5
              ? [const Icon(Icons.star_half, color: Colors.amber, size: 14)]
              : []),
    );
  }
}
