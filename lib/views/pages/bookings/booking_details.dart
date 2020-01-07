import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:huluage_demo/model/booking.dart';
import 'package:huluage_demo/scoped_model/mainModel.dart';
import 'package:scoped_model/scoped_model.dart';

class BookingDetailsPage extends StatelessWidget {
  final int index;
  BookingDetailsPage(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Details"),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: ScopedModelDescendant<MainModel>(builder: (context,child, model){
        final Booking booking = model.allBookings[index];
        return ListView(
          children: <Widget>[
            Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      CircleAvatar(
                        minRadius: 60,
                        backgroundColor: Colors.deepOrange,
                          child: Icon(
                            FontAwesomeIcons.truck,
                            size: 35.0,
                            color: Colors.white,
                          ),
                      ),

                    ],
                  ),
                  SizedBox(height: 10,),
                  Text(booking.trackingNumber, style: TextStyle(fontSize: 22.0, color: Colors.black),),
                  Text(model.allTrucks[index].truckName, style: TextStyle(fontSize: 18.0, color: Colors.black),)
                ],
              ),
            ),
            Container(
              // height: 50,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text(model.allTrucks[index].driverName,textAlign: TextAlign.center, style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0
                        ),),
                        subtitle: Text("DRIVER NAME", textAlign: TextAlign.center, style: TextStyle(color: Colors.black),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text(model.allTrucks[index].plateNumber,textAlign: TextAlign.center, style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0
                        ),),
                        subtitle: Text("PLATE NUMBER", textAlign: TextAlign.center, style: TextStyle(color: Colors.black),),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              // height: 50,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: Text("Tracking Number", style: TextStyle(color: Colors.black87, fontSize: 12.0),),
                      subtitle: Text(booking.trackingNumber, style: TextStyle(fontSize: 18.0,color: Colors.black),),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:  RaisedButton(
                            padding: EdgeInsets.all(6.0),
                            shape: StadiumBorder(),
                            child: Text("VIEW ON MAP", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),

                            ),
                            color: Colors.black,
                            onPressed: () {
                              Navigator.pushNamed(context, '/bookingmap');
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            ListTile(
              title: Text("Tracking Number", style: TextStyle(color: Colors.black87, fontSize: 12.0),),
              subtitle: Text(booking.trackingNumber, style: TextStyle(fontSize: 18.0,color: Colors.black),),
            ),
            Divider(),
            ListTile(
              title: Text("PickUp Location", style: TextStyle(color: Colors.black87, fontSize: 12.0),),
              subtitle: Text(booking.pickupLocation, style: TextStyle(fontSize: 18.0,color: Colors.black)),
            ),
            Divider(),
            ListTile(
              title: Text("Delivery Location", style: TextStyle(color: Colors.black87, fontSize: 12.0),),
              subtitle: Text(booking.deliveryLocation, style: TextStyle(fontSize: 18.0,color: Colors.black),),
            ),
            Divider(),
            ListTile(
              title: Text("Delivery Time", style: TextStyle(color: Colors.black87, fontSize: 12.0),),
              subtitle: Text(booking.deliverytime, style: TextStyle(fontSize: 18.0,color: Colors.black),),
            ),
            Divider(),
          ],
        );
      },),
    );
  }
}


