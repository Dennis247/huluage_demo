import 'package:flutter/material.dart';
import 'package:huluage_demo/model/bookingPayment.dart';
import 'package:huluage_demo/scoped_model/mainModel.dart';
import 'package:huluage_demo/views/widgets/cards/payment_card.dart';
import 'package:huluage_demo/views/widgets/common_scaffold.dart';
import 'package:scoped_model/scoped_model.dart';

class PaymentsPage extends StatefulWidget {
  @override
  _PaymentsPageState createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {

  var deviceSize;
  Widget _buildPaymentList( List<BookingPayment> payments){
    Widget bookingsCardsView = Center(child: Text("There are currently no notification"),);
    if(payments.length > 0){
      bookingsCardsView = ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemBuilder: (BuildContext context,int index)=>PaymentCard(payments[index],index),
        itemCount: payments.length,
      );
    }
    return bookingsCardsView;
  }

  Widget bodyData() {
    return ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child,MainModel model){
      return  _buildPaymentList(model.allBookingPayments);
    },) ;
  }

  Widget _scaffold() => CommonScaffold(
      appTitle: "Payments",
      bodyData: bodyData(),
      showFAB: false,
      showDrawer: false,
      floatingIcon: null

  );

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return  _scaffold();
  }
}

