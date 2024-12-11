import 'package:geolocator/geolocator.dart';

class Location{
  double? longitude;
  double? latitude;

  Future<void> getCurrentLocation()async{
    try{
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever) {
        print("Location permission is permanently denied. Please enable it from settings.");
      } else {
        final LocationSettings locationSettings = LocationSettings(
          accuracy: LocationAccuracy.low,
          distanceFilter: 100,
        );
        Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
        latitude=position.latitude;
        longitude=position.longitude;
      }
    }
    catch(e){
      print(e);
    }
  }
}

