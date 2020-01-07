import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' show cos, sqrt, asin;

const apiKey = "AIzaSyC918CgSt6PtLreO7WjMY5yqGB91z2amSY";

class GoogleMapServices {
  Future<String> getRouteCordinates(LatLng l1, LatLng l2) async {
    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${l1.latitude},${l1.longitude}&destination=${l2.latitude},${l2.longitude}&key=$apiKey";
    http.Response response = await http.get(url);
    Map values = jsonDecode(response.body);
    return values["routes"][0]["overview_polyline"]["points"];
  }

  //To calculate distance between two cordinates

  double calculateDistance(LatLng l1, LatLng l2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((l2.latitude - l1.latitude) * p) / 2 +
        c(l1.latitude * p) *
            c(l2.latitude * p) *
            (1 - c((l2.longitude - l1.longitude) * p)) /
            2;
    return 12742 * asin(sqrt(a));
  }
}
