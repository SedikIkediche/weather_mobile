import 'package:location/location.dart';

class LocationService {
  Location _location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  Future<bool> requestLocationService() async {
    bool isLocationServiceEnabled;
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        isLocationServiceEnabled = false;
      } else {
        isLocationServiceEnabled = true;
      }
    } else {
      isLocationServiceEnabled = true;
    }
    return isLocationServiceEnabled;
  }

  Future<bool> requestPermission() async {
    bool isPermissionGranted;
    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        isPermissionGranted = false;
      } else {
        isPermissionGranted = true;
      }
    } else {
      isPermissionGranted = true;
    }
    return isPermissionGranted;
  }

  Future<LocationData> requestLocation() async {
    LocationData locationData = await _location.getLocation();
    return locationData;
  }
}
