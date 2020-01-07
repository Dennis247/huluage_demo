import 'package:flutter/material.dart';
import 'package:huluage_demo/views/widgets/booking_list.dart';


class BookingHistoryPage extends StatefulWidget {
  @override
  _BookingHistoryPageState createState() => _BookingHistoryPageState();
}

class _BookingHistoryPageState extends State<BookingHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return BookingListPage(true);
  }
}

