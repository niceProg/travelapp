import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/trip/presentation/pages/trip_detail_page.dart';
import 'core/theme.dart';
import 'features/home/presentation/pages/home_page.dart';
// import 'features/trip/presentation/pages/trip_list_page.dart';
import 'features/trip/data/repositories/trip_repository.dart';
import 'features/trip/presentation/providers/trip_provider.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TripProvider(TripRepositoryImpl())..loadTrips(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Travel App',
        theme: AppTheme.lightTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/trip_detail': (context) => const TripDetailPage(),
        },
      ),
    );
  }
}
