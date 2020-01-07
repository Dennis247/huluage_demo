import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:huluage_demo/utils/google_map_services.dart';
import 'package:location/location.dart';

class BookingMapLocation extends StatefulWidget {
  @override
  _BookingMapLocationState createState() => _BookingMapLocationState();
}

class _BookingMapLocationState extends State<BookingMapLocation> {
  GoogleMapController mapController;
  GoogleMapServices _googleMapServices = new GoogleMapServices();
  TextEditingController locationController = TextEditingController();
  TextEditingController desinationController = TextEditingController();
  static LatLng _initialPosition;
  LatLng _lastposition = _initialPosition;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};
  Location location = new Location();

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Booking Details"),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
        ),
        body: _initialPosition == null
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : Container(
                child: Stack(
                  children: <Widget>[
                    GoogleMap(
                      initialCameraPosition:
                          CameraPosition(target: _initialPosition, zoom: 10),
                      onMapCreated: onCreateMap,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      mapType: MapType.normal,
                      compassEnabled: true,
                      markers: _markers,
                      onCameraMove: onCaeraMove,
                    ),
                  ],
                ),
              ));
  }

  void onCreateMap(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void onCaeraMove(CameraPosition position) {
    setState(() {
      _lastposition = position.target;
    });
  }

  void addMarker(LatLng location, String address) {
    _markers.add(Marker(
        markerId: MarkerId(_lastposition.toString()),

//      position: _lastposition,
//      infoWindow: InfoWindow(
//        title: "remeber here",
//        snippet: "This is a very good place to be"
//      ),icon: BitmapDescriptor.defaultMarker

        position: location,
        infoWindow: InfoWindow(title: "address", snippet: "Go Here"),
        icon: BitmapDescriptor.defaultMarker));
  }

  //convert list of doubles into LatLng
  List<LatLng> convvertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    return result;
  }

  List _decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = new List();
    int index = 0;
    int len = poly.length;
    int c = 0;
// repeating until all attributes are decoded
    do {
      var shift = 0;
      int result = 0;

      // for decoding value of one attribute
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      /* if value is negetive then bitwise not the value */
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

/*adding to previous value as done in encoding */
    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];

    print(lList.toString());

    return lList;
  }

  void createRoute(String endcodedPolyLine) {
    setState(() {
      _polylines.add(
        Polyline(
            polylineId: PolylineId(_lastposition.toString()),
            width: 10,
            color: Colors.black,
            points: convvertToLatLng(_decodePoly(endcodedPolyLine))),
      );
    });
  }

  void _getUserLocation() async {
//    Position position = await Geolocator()
//        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    LocationData position = await location.getLocation();
    List<Placemark> placemark = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    location.onLocationChanged().listen((LocationData currentLocation) {
      print(currentLocation.latitude);
      print(currentLocation.longitude);
    });
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      locationController.text = placemark[0].name;
    });
  }

  void sendRequest(String IntendedLocation) async {
    List<Placemark> placemark =
        await Geolocator().placemarkFromAddress(IntendedLocation);
    double latitude = placemark[0].position.latitude;
    double logitude = placemark[1].position.longitude;
    LatLng destination = LatLng(latitude, logitude);

    addMarker(destination, IntendedLocation);
    String route = await _googleMapServices.getRouteCordinates(
        _initialPosition, destination);
    createRoute(route);
  }

  void _getLocationUpdate() {
    location.onLocationChanged().listen((LocationData currentLocation) {
      print(currentLocation.latitude);
      print(currentLocation.longitude);
    });
  }
}
