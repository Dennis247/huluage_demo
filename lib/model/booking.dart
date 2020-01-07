
import 'package:flutter/material.dart';

class Booking{
  final int id;
  final String deliveryLocation;
  final String pickupLocation;
  final String deliverytime;
  final int truckid;
  final int driverid;
  final bool isDelivered;
  final String date;
  final String paymentMethod;
  final String trackingNumber;



  Booking({
    @required this.id,
    @required this.deliveryLocation,
    @required this.pickupLocation,
    @required this.deliverytime,
    @required this.truckid,
    @required this.driverid,
    @required this.isDelivered,
    @required this.date,
    @required this.paymentMethod,
    @required this.trackingNumber
  });
}