import 'package:flutter/material.dart';

class BookingPayment{
  final int id;
  final String title;
  final String paymentDescription;
  final String date;
  final int bookingid;

  BookingPayment({
    @required this.id,
    @required this.title,
    @required this.paymentDescription,
    @required this.date,
    @required this.bookingid
  });
}