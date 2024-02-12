import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class LocationHelper {
  var ipconfig="http://192.168.1.5:8000";

  Future<Position> getUserCurrentLocation( id ) async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });

    Geolocator.getPositionStream().listen((Position position) {
      updatePatientCoordinate(id, position.latitude, position.longitude);
    });

    return await Geolocator.getCurrentPosition();
  }

  Future<void> updatePatientCoordinate(int id, double latitude, double longitude) async {
    final url = Uri.parse('$ipconfig/api/PatientCoordinate/update/$id?latitude$latitude&longitude=$longitude');
    final response = await http.put(url, body: {'latitude': latitude.toString(), 'longitude': longitude.toString()});
    if (response.statusCode == 200) {
      // The request was successful
      print('Patient coordinate updated successfully');
    } else {
      // The request failed
      print('Failed to update patient coordinate');
    }
  }

}

