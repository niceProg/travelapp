import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CustomCacheManager {
  static final instance = CacheManager(
    Config(
      'customCacheKey',
      stalePeriod: const Duration(days: 7), // Simpan cache selama 7 hari
      maxNrOfCacheObjects: 50, // Maksimal 50 gambar dalam cache
    ),
  );
}
