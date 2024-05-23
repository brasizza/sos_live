abstract interface class LocationRepository {
  Future<bool> distressOn({required String sessionToken, required double latitude, required double longitude});

  Future<bool> distressOff({required String sessionToken});

  Future<bool> neaby({required String sessionToken});
}
