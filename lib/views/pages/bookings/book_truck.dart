import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:huluage_demo/utils/google_map_services.dart';
import 'package:location/location.dart';

class BookTruckPage extends StatefulWidget {
  @override
  _BookTruckPageState createState() => _BookTruckPageState();
}

class _BookTruckPageState extends State<BookTruckPage> {
  GoogleMapController mapController;
  GoogleMapServices _googleMapServices = new GoogleMapServices();
  TextEditingController locationController = TextEditingController();
  TextEditingController desinationController = TextEditingController();
  static LatLng _initialPosition = LatLng(6.5244, 3.3792);
  LatLng destination;
  List<LatLng> _allLatLangPoints = [];
  LatLng _lastposition = _initialPosition;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  var location = new Location();
  Map<String, double> userLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Book Truck"),
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
                      polylines: _polylines,
                    ),
                    Positioned(
                      top: 50.0,
                      right: 15.0,
                      left: 15.0,
                      child: Container(
                        height: 50.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1.0, 5.0),
                                blurRadius: 10,
                                spreadRadius: 3)
                          ],
                        ),
                        child: TextField(
                          cursorColor: Colors.black,
                          controller: locationController,
                          decoration: InputDecoration(
                            icon: Container(
                              margin: EdgeInsets.only(left: 20, top: 5),
                              width: 10,
                              height: 10,
                              child: Icon(
                                Icons.location_on,
                                color: Colors.black,
                              ),
                            ),
                            hintText: "pick up",
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(left: 15.0, top: 16.0),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 105.0,
                      right: 15.0,
                      left: 15.0,
                      child: Container(
                        height: 50.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1.0, 5.0),
                                blurRadius: 10,
                                spreadRadius: 3)
                          ],
                        ),
                        child: TextField(
                          cursorColor: Colors.black,
                          controller: desinationController,
                          textInputAction: TextInputAction.go,
                          onSubmitted: (value) {
                            //   appState.sendRequest(value);
                            sendRequest(value);
                          },
                          decoration: InputDecoration(
                            icon: Container(
                              margin: EdgeInsets.only(left: 20, top: 5),
                              width: 10,
                              height: 10,
                              child: Icon(
                                Icons.local_taxi,
                                color: Colors.black,
                              ),
                            ),
                            hintText: "destination?",
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(left: 15.0, top: 16.0),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 50.0,
                      left: 50.0,
                      bottom: 20.0,
                      child: RaisedButton(
                        padding: EdgeInsets.all(14.0),
                        elevation: 5.0,
                        shape: StadiumBorder(),
                        child: Text(
                          "PROCEED WITH BOOKING",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        color: Colors.black,
                        onPressed: () {
                          //Calculate distance between the two cordinates
                          var totalDistance = _googleMapServices
                              .calculateDistance(_initialPosition, destination);
                          print(totalDistance.toString());
                          Navigator.pushNamed(context, '/confirmbooking');
                        },
                      ),
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
        infoWindow: InfoWindow(title: address, snippet: "Go to $address"),
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
    _allLatLangPoints = convvertToLatLng(_decodePoly(endcodedPolyLine));
    setState(() {
      _polylines.add(
        Polyline(
            polylineId: PolylineId(_lastposition.toString()),
            width: 5,
            color: Colors.deepOrange,
            visible: true,
            points: _allLatLangPoints),
      );
    });
  }

  void _getUserLocation() async {
    var currentLocation = await location.getLocation();
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(
        currentLocation.latitude, currentLocation.longitude);
    setState(() {
      _initialPosition =
          LatLng(currentLocation.latitude, currentLocation.longitude);
      locationController.text =
          placemark[0].thoroughfare +
              "" +
              placemark[0].name +
              ", " +
              placemark[0].locality;
    });
  }

  void sendRequest(String IntendedLocation) async {
    List<Placemark> placemark =
        await Geolocator().placemarkFromAddress(IntendedLocation);
    double latitude = placemark[0].position.latitude;
    double logitude = placemark[0].position.longitude;
    destination = LatLng(latitude, logitude);

    addMarker(destination, IntendedLocation);
    String route = await _googleMapServices.getRouteCordinates(
        _initialPosition, destination);
    createRoute(route);
  }
}
