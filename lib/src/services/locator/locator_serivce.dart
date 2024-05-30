import 'dart:developer';

import 'package:geolocator/geolocator.dart';

class LocatorSerivce {
  bool serviceEnable = false;
  Position? position;

  Future<void> getLocation() async {
    position = await Geolocator.getCurrentPosition();
    log(position.toString());
  }

  Future<void> init() async {
    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error('Localização não habilitada');
    }
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Permissão negada');
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error('Permissão negada permanentemente');
      }
    }
    await getLocation();
  }
}
