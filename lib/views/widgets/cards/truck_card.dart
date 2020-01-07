import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:huluage_demo/model/truck.dart';

class TruckCard extends StatelessWidget {
  final Truck truck;
  final int index;

  TruckCard(this.truck, this.index);
  Widget _truckItem(BuildContext context) {
    return Card(
      elevation: 3,
      child: Row(
        children: <Widget>[
          Container(
            height: 75,
            width: 75,
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 50),
            child: Icon(
              FontAwesomeIcons.truck,
              size: 55.0,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  truck.truckName,
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w700,
                      fontSize: 17),
                ),
                Text(
                  truck.driverName,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                Text(
                  truck.plateNumber,
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.pink,
                      size: 18,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.pink,
                      size: 18,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.pink,
                      size: 18,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.pink,
                      size: 18,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.pink,
                      size: 18,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    padding: EdgeInsets.all(6.0),
                    shape: StadiumBorder(),
                    child: Text(
                      "BOOK TRUCK",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pushNamed(context, '/booktruck');
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _truckItem(context);
  }
}
