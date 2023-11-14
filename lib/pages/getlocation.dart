import 'package:location/location.dart';

class LocationService {
  static Location _location = Location();

  static Future<String> getLocationString() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return 'Location service not enabled';
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return 'Location permission not granted';
      }
    }

    try {
      LocationData locationData = await _location.getLocation();
      return '${locationData.latitude},${locationData.longitude}';
    } catch (e) {
      return 'Error getting location: $e';
    }
  }
}
