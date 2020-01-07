import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConfirmBookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Confirm Booking"),
        ),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 330,
                    color: Colors.white,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[UserInfo()],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Booking Information",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Divider(
                    color: Colors.black38,
                  ),
                  Container(
                      child: Column(
                    children: <Widget>[
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        leading: Icon(
                          Icons.my_location,
                          color: Colors.black,
                        ),
                        title: Text("Pickup Location"),
                        subtitle: Text("Kathmandu"),
                      ),
                      ListTile(
                        leading: Icon(
                          FontAwesomeIcons.mapMarkerAlt,
                          color: Colors.black,
                        ),
                        title: Text("Destination"),
                        subtitle: Text("Mary Land"),
                      ),
                      ListTile(
                        leading: Icon(
                          FontAwesomeIcons.directions,
                          color: Colors.black,
                        ),
                        title: Text("Total Distance"),
                        subtitle: Text("22 miles"),
                      ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.moneyBill,
                            color: Colors.black),
                        title: Text("Total Amount"),
                        subtitle: Text("N50,000.00"),
                      ),
                      ListTile(
                        leading:
                            Icon(FontAwesomeIcons.clock, color: Colors.black),
                        title: Text("Time To Destination"),
                        subtitle: Text("2hrs : 20"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: RaisedButton(
                          padding: EdgeInsets.all(16.0),
                          shape: StadiumBorder(),
                          child: Text(
                            "CONFIRM BOOKING",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.pushNamed(context, '/confirmbooking');
                          },
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
