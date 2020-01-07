import 'package:huluage_demo/model/notification.dart';
import 'package:scoped_model/scoped_model.dart';

mixin NotificationModel on Model{
  int  _currentSelectedNotificationIndex;
  List<BookingNotification> _notifications=[];

  void setSelectedNotification(int index){
    _currentSelectedNotificationIndex = index;
    notifyListeners();
  }


  int get selectedNotificationIndex{
    return _currentSelectedNotificationIndex;
  }

  BookingNotification get selectedNotification{
    if(selectedNotificationIndex == null){
      return null;
    }
    return _notifications[_currentSelectedNotificationIndex];
  }

  List<BookingNotification>get allNotifications{
    if(_notifications.length > 0){
      return List.from(_notifications);

    }else{
      initialiseNotificationRepos();
      return List.from(_notifications);
    }

  }




  void addNotification(BookingNotification truck){
    _notifications.add(truck);
    notifyListeners();
  }

  void updateNotification(BookingNotification updatedNotification){

    _notifications[selectedNotificationIndex] = updatedNotification;
    notifyListeners();
  }

  void deleteNotification(){
    _notifications.removeAt(_currentSelectedNotificationIndex);
    notifyListeners();
  }


  void initialiseNotificationRepos(){
    _notifications.add(new BookingNotification(id: 1, noficationMessage: "Delivery With Truck Number BJ947MUS to Maryland was Sucessfull", date: "12 Dec 2020", bookingid: 1, title: "Sucessfull"));
    _notifications.add(new BookingNotification(id: 2, noficationMessage: "Delivery With Truck Number BJ947MUS to Maryland was Sucessfull", date: "12 Jan 2020", bookingid: 2, title: "Sucessfull"));
    _notifications.add(new BookingNotification(id: 3, noficationMessage: "Delivery With Truck Number BJ947MUS to Maryland was Sucessfull", date: "12 Mar 2020", bookingid: 3, title: "Sucessfull"));
    _notifications.add(new BookingNotification(id: 4, noficationMessage: "Delivery With Truck Number BJ947MUS to Maryland was Sucessfull", date: "12 July 2020", bookingid: 4, title: "Sucessfull"));
    _notifications.add(new BookingNotification(id: 5, noficationMessage: "Delivery With Truck Number BJ947MUS to Maryland was Sucessfull", date: "12 June 2020", bookingid: 5, title: "Sucessfull"));
    _notifications.add(new BookingNotification(id: 6, noficationMessage: "Delivery With Truck Number BJ947MUS to Maryland was Sucessfull", date: "12 Nov 2020", bookingid: 6, title: "Sucessfull"));
    _notifications.add(new BookingNotification(id: 7, noficationMessage: "Delivery With Truck Number BJ947MUS to Maryland was Sucessfull", date: "12 Jan 2020", bookingid: 7, title: "Sucessfull"));
    _notifications.add(new BookingNotification(id: 8, noficationMessage: "Delivery With Truck Number BJ947MUS to Maryland was Sucessfull", date: "12 Dec 2020", bookingid: 8, title: "Sucessfull"));
    _notifications.add(new BookingNotification(id: 9, noficationMessage: "Delivery With Truck Number BJ947MUS to Maryland was Sucessfull", date: "12 Dec 2020", bookingid: 9, title: "Sucessfull"));
    _notifications.add(new BookingNotification(id: 10, noficationMessage: "Delivery With Truck Number BJ947MUS to Maryland was Sucessfull", date: "12 Nov 2020", bookingid: 10, title: "Sucessfull"));

  }

}