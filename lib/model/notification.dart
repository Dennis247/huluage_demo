import 'package:flutter/material.dart';

class BookingNotification{
  final int id;
  final String title;
  final String noficationMessage;
  final String date;
  final int bookingid;


  BookingNotification({
    @required this.id,
    @required this.noficationMessage,
    @required this.date,
    @required this.bookingid,
    @required this.title
  });
}