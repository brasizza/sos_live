import 'package:projeto_sos/src/data/models/user_model.dart';

abstract interface class LocationRepository {
  Future<bool> distressOn({required String sessionToken, required double latitude, required double longitude});

  Future<bool> distressOff({required String sessionToken});

  Future<List<UserModel>?> neaby({required String sessionToken});
}
