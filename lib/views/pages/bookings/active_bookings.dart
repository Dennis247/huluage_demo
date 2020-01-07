import 'package:flutter/material.dart';
import 'package:huluage_demo/views/widgets/booking_list.dart';


class ActivebookingsPage extends StatefulWidget {
  @override
  _ActivebookingsPageState createState() => _ActivebookingsPageState();
}

class _ActivebookingsPageState extends State<ActivebookingsPage> {
  @override
  Widget build(BuildContext context) {
    return BookingListPage(false);
  }
}

