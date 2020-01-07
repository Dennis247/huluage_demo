import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:huluage_demo/scoped_model/mainModel.dart';
import 'package:huluage_demo/utils/uidata.dart';
import 'package:scoped_model/scoped_model.dart';

import 'about_tile.dart';

class CommonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  "Pawan Kumar",
                ),
                accountEmail: Text(
                  "Dennis",
                ),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new AssetImage(UIData.pkImage),
                ),
              ),
              new ListTile(
                title: Text(
                  "Trucks",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                ),
                leading: Icon(
                  Icons.departure_board,
                  color: Colors.black54,
                ),
                onTap: () {
                  //  Navigator.pushReplacementNamed(context, '/trucks');
                  Navigator.popAndPushNamed(context, '/trucks');
                },
              ),
              new ListTile(
                title: Text(
                  "Bookings",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                ),
                leading: Icon(
                  Icons.library_books,
                  color: Colors.black54,
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/bookings');
                },
              ),
              new ListTile(
                title: Text(
                  "Notifications",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                ),
                leading: Icon(
                  Icons.notifications_active,
                  color: Colors.black54,
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/notifications');
                },
              ),
              new ListTile(
                title: Text(
                  "Payments",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                ),
                leading: Icon(
                  Icons.monetization_on,
                  color: Colors.black54,
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/payments');
                },
              ),
              Divider(),
              new ListTile(
                title: Text(
                  "Log Out",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                ),
                leading: Icon(
                  FontAwesomeIcons.lock,
                  color: Colors.black54,
                ),
                onTap: () {
                  model.logOut();
                },
              ),
              Divider(),
              MyAboutTile()
            ],
          ),
        );
      },
    );
  }
}
