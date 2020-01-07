import 'package:flutter/material.dart';
import 'package:huluage_demo/model/booking.dart';
import 'package:huluage_demo/model/truck.dart';
import 'package:huluage_demo/scoped_model/mainModel.dart';
import 'package:scoped_model/scoped_model.dart';

import 'cards/booking_card.dart';

class BookingListPage extends StatefulWidget {
  final bool isActive;
   BookingListPage(this.isActive);

  @override
  _BookingListPageState createState() => _BookingListPageState();
}

class _BookingListPageState extends State<BookingListPage> {

  var deviceSize;
  Widget _buildProductList( List<Booking> bookings,List<Truck>trucks){
    Widget bookingsCardsView = Center(child: Text("There are currently no trucks in the list"),);
    if(bookings.length > 0){
      bookingsCardsView = ListView.builder(

        padding: EdgeInsets.all(10.0),
        itemBuilder: (BuildContext context,int index)=>BookingCard(bookings[index],index,trucks[index]),
        itemCount: bookings.length,
      );
    }
    return bookingsCardsView;
  }

  Widget bodyData() {
    return ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child,MainModel model){
      return  widget.isActive ? _buildProductList(model.completedBookings,model.allTrucks) : _buildProductList(model.activeBookings,model.allTrucks);
    },) ;
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return bodyData();
  }
}
