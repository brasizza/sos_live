import 'package:dio/dio.dart';
import 'package:projeto_sos/src/data/models/user_model.dart';

import './location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final Dio dio;

  LocationRepositoryImpl({required this.dio});

  @override
  Future<bool> distressOff({required String sessionToken}) async {
    final response = await dio.post('/distressOff', data: {
      'sessionToken': sessionToken,
    });
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Future<bool> distressOn({required String sessionToken, required double latitude, required double longitude}) async {
    final response = await dio.post('/distressOn', data: {'sessionToken': sessionToken, 'latitude': latitude, 'longitude': longitude});
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Future<List<UserModel>?> neaby({required String sessionToken}) async {
    final resposne = await dio.post('/getNearby', data: {
      'sessionToken': sessionToken,
      'range': 100,
    });
    if (resposne.statusCode == 200) {
      return (resposne.data['result']['nearbyLocations'] as List)
          .map(
            (user) => UserModel.fromMap(
              user['user'],
            ),
          )
          .toList();
      //print(resposne.data);
    }
    return null;
  }
}
