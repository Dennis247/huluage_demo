import 'package:huluage_demo/model/booking.dart';
import 'package:scoped_model/scoped_model.dart';

mixin BookingModel on Model{
  int  _currentSelectedBookingIndex;
  List<Booking> _bookings=[];

  void setSelectedBooking(int index){
    _currentSelectedBookingIndex = index;
    notifyListeners();
  }


  int get selectedBookingIndex{
    return _currentSelectedBookingIndex;
  }

  Booking get selectedBooking{
    if(selectedBookingIndex == null){
      return null;
    }
    return _bookings[_currentSelectedBookingIndex];
  }

  List<Booking>get allBookings{
    if(_bookings.length > 0){
      return List.from(_bookings);

    }else{
      initialiseBookingRepos();
      return List.from(_bookings);
    }

  }

  List<Booking> get activeBookings{
    if(_bookings.length > 0){
      return _bookings.where((Booking booking)=>booking.isDelivered == false).toList();
    }else{
      initialiseBookingRepos();
      return _bookings.where((Booking booking)=>booking.isDelivered == false).toList();
    }

  }

  List<Booking> get completedBookings{
    return _bookings.where((Booking booking)=>booking.isDelivered).toList();
  }

  void addBooking(Booking truck){
    _bookings.add(truck);
    notifyListeners();
  }

  void updateBooking(Booking updatedBooking){

    _bookings[selectedBookingIndex] = updatedBooking;
    notifyListeners();
  }

  void deleteBooking(){
    _bookings.removeAt(_currentSelectedBookingIndex);
    notifyListeners();
  }


  void initialiseBookingRepos(){

    _bookings.add(new Booking(id: 1,driverid: 1, deliveryLocation: "Mary Land", pickupLocation: "Ojota", deliverytime: "1hr : 20mins", truckid: 1,isDelivered: true,paymentMethod: "Cash",date:"13 dec 2009",trackingNumber: "89877" ));
    _bookings.add(new Booking(id: 2,driverid: 2, deliveryLocation: "Palm Groove", pickupLocation: "Ojota", deliverytime: "1hr : 20mins", truckid: 1,isDelivered: false,paymentMethod: "Cash",date:"13 dec 2009",trackingNumber: "89877"));
    _bookings.add(new Booking(id: 3,driverid: 3, deliveryLocation: "Mary Land", pickupLocation: "Ojota", deliverytime: "1hr : 20mins", truckid: 1,isDelivered: false,paymentMethod: "Cash",date:"13 dec 2009",trackingNumber: "89877"));
    _bookings.add(new Booking(id: 4, driverid: 4,deliveryLocation: "Mary Land", pickupLocation: "Ojota", deliverytime: "1hr : 20mins", truckid: 1,isDelivered: true,paymentMethod: "Cash",date:"13 dec 2009",trackingNumber: "89877"));
    _bookings.add(new Booking(id: 5,driverid: 5, deliveryLocation: "Mary Land", pickupLocation: "Ojota", deliverytime: "1hr : 20mins", truckid: 1,isDelivered: true,paymentMethod: "Cash",date:"13 dec 2009",trackingNumber: "89877"));
    _bookings.add(new Booking(id: 6, driverid: 6,deliveryLocation: "Mary Land", pickupLocation: "Ojota", deliverytime: "1hr : 20mins", truckid: 1,isDelivered: false,paymentMethod: "Cash",date:"13 dec 2009",trackingNumber: "89877"));
    _bookings.add(new Booking(id: 7, driverid: 7,deliveryLocation: "Mary Land", pickupLocation: "Ojota", deliverytime: "1hr : 20mins", truckid: 1,isDelivered: false,paymentMethod: "Cash",date:"13 dec 2009",trackingNumber: "89877"));
    _bookings.add(new Booking(id: 8,driverid: 8, deliveryLocation: "Mary Land", pickupLocation: "Ojota", deliverytime: "1hr : 20mins", truckid: 1,isDelivered: true,paymentMethod: "Cash",date:"13 dec 2009",trackingNumber: "89877"));
    _bookings.add(new Booking(id: 9, driverid: 9,deliveryLocation: "Mary Land", pickupLocation: "Ojota", deliverytime: "1hr : 20mins", truckid: 1,isDelivered: false,paymentMethod: "Cash",date:"13 dec 2009",trackingNumber: "99877"));
    _bookings.add(new Booking(id: 10, driverid: 10,deliveryLocation: "Mary Land", pickupLocation: "Ojota", deliverytime: "1hr : 20mins", truckid: 1,isDelivered: true,paymentMethod: "Cash",date:"13 dec 2009",trackingNumber: "59877"));
  }


}