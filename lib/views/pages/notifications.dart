import 'package:flutter/material.dart';
import 'package:huluage_demo/model/notification.dart';
import 'package:huluage_demo/scoped_model/mainModel.dart';
import 'package:huluage_demo/views/widgets/cards/notification_card.dart';
import 'package:huluage_demo/views/widgets/common_scaffold.dart';
import 'package:scoped_model/scoped_model.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  var deviceSize;
  Widget _buildNotificationList( List<BookingNotification> notifications){
    Widget bookingsCardsView = Center(child: Text("There are currently no notification"),);
    if(notifications.length > 0){
      bookingsCardsView = ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemBuilder: (BuildContext context,int index)=>NotificationCard(notifications[index],index),
        itemCount: notifications.length,
      );
    }
    return bookingsCardsView;
  }

  Widget bodyData() {
    return ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child,MainModel model){
      return  _buildNotificationList(model.allNotifications);
    },) ;
  }

  Widget _scaffold() => CommonScaffold(
      appTitle: "Notifications",
      bodyData: bodyData(),
      showFAB: false,
      showDrawer: false,
      floatingIcon: null

  );



  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return _scaffold();
  }
}
