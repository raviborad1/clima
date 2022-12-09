import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getlocation() async {
    try {
      // bool islocationServiceEnable =
      //     await Geolocator.isLocationServiceEnabled();
      // await Geolocator.checkPermission();
      // await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
