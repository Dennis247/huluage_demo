import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:huluage_demo/model/notification.dart';

class NotificationCard extends StatelessWidget {
  final BookingNotification notification;
  final int id;
   NotificationCard(this.notification, this.id);

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
              FontAwesomeIcons.bell,
              size: 14.0,
              color: Colors.white,
            ),
          radius: 15,
        ),
        title: Text(notification.title,style: TextStyle(color: Colors.green[800]),),
        subtitle: Text(notification.noficationMessage),
        trailing: Text(
          notification.date,
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
