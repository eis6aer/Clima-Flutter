import 'package:geolocator/geolocator.dart';

class GetLocation {
  double latitude;
  double longitude;

  Future<void> invoke() async {
    try {
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      this.latitude = position.latitude;
      this.longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}