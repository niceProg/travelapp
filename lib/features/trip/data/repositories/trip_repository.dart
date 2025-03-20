import 'dart:convert';
import 'package:flutter/services.dart';
import '../../domain/models/trip_model.dart';

abstract class TripRepository {
  Future<List<TripModel>> fetchTrips();
}

class TripRepositoryImpl implements TripRepository {
  @override
  Future<List<TripModel>> fetchTrips() async {
    try {
      String data = await rootBundle.loadString('assets/data/trips.json');
      List<dynamic> jsonList = json.decode(data);
      
      return jsonList.map((json) => TripModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Failed to load trips: $e");
    }
  }
}
