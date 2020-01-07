import 'package:flutter/material.dart';

class ConfirmBooking {
  final String pickUpLocation;
  final String destination;
  final double totalDistance;
  final double pricePerKm;
  final String estimatedTimeToDestination;

  ConfirmBooking(
      {@required this.pickUpLocation,
      @required this.destination,
      @required this.totalDistance,
      @required this.pricePerKm,
      @required this.estimatedTimeToDestination});
}
