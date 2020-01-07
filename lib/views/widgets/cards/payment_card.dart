import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:huluage_demo/model/bookingPayment.dart';



class PaymentCard extends StatelessWidget {
  final BookingPayment bookingPayment;
  final int id;

   PaymentCard(this.bookingPayment, this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: ListTile(
          leading: CircleAvatar(
            child:  Icon(
              FontAwesomeIcons.dollarSign,
              size: 14.0,
              color: Colors.white,
            ),
            radius: 15,
          ),
          title: Text(bookingPayment.title,style: TextStyle(color: Colors.green[800]),),
          subtitle: Text(bookingPayment.paymentDescription),
          trailing: Text(
            bookingPayment.date,
            style: TextStyle(
                color: Colors.green[800],
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
