import 'package:flutter/material.dart';
import '../../domain/models/trip_model.dart';
import '../../data/repositories/trip_repository.dart';

class TripProvider with ChangeNotifier {
  final TripRepository _tripRepository;

  TripProvider(this._tripRepository);

  List<TripModel> _trips = [];
  List<TripModel> get trips => _trips;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadTrips() async {
    _isLoading = true;
    notifyListeners();

    try {
      _trips = await _tripRepository.fetchTrips();
    } catch (e) {
      debugPrint("Error loading trips: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
