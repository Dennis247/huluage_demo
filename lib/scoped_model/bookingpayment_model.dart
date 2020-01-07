import 'package:huluage_demo/model/bookingPayment.dart';
import 'package:scoped_model/scoped_model.dart';

mixin BookingPaymentModel on Model{
  int  _currentSelectedBookingPaymentIndex;
  List<BookingPayment> _payments=[];

  void setSelectedBookingPayment(int index){
    _currentSelectedBookingPaymentIndex = index;
    notifyListeners();
  }


  int get selectedBookingPaymentIndex{
    return _currentSelectedBookingPaymentIndex;
  }

  BookingPayment get selectedBookingPayment{
    if(selectedBookingPaymentIndex == null){
      return null;
    }
    return _payments[_currentSelectedBookingPaymentIndex];
  }

  List<BookingPayment>get allBookingPayments{
    if(_payments.length > 0){
      return List.from(_payments);

    }else{
      initialiseBookingPaymentRepos();
      return List.from(_payments);
    }

  }


  void addBookingPayment(BookingPayment truck){
    _payments.add(truck);
    notifyListeners();
  }

  void updateBookingPayment(BookingPayment updatedBookingPayment){

    _payments[selectedBookingPaymentIndex] = updatedBookingPayment;
    notifyListeners();
  }

  void deleteBookingPayment(){
    _payments.removeAt(_currentSelectedBookingPaymentIndex);
    notifyListeners();
  }


  void initialiseBookingPaymentRepos(){
    _payments.add(new BookingPayment(id: 1, title: "SucessFull",paymentDescription: "Booking of Toyota Truck with plate number was sucessfull  ", date: "12 dec w018", bookingid: 1));
    _payments.add(new BookingPayment(id: 2,title: "SucessFull", paymentDescription: "Booking of Toyota Truck with plate number was sucessfull  ", date: "12 dec w018", bookingid: 2));
    _payments.add(new BookingPayment(id: 3,title: "SucessFull", paymentDescription: "Booking of Toyota Truck with plate number was sucessfull  ", date: "12 dec w018", bookingid: 3));
    _payments.add(new BookingPayment(id: 4,title: "SucessFull", paymentDescription: "Booking of Toyota Truck with plate number was sucessfull  ", date: "12 dec w018", bookingid: 4));
    _payments.add(new BookingPayment(id: 5,title: "SucessFull", paymentDescription: "Booking of Toyota Truck with plate number was sucessfull  ", date: "12 dec w018", bookingid: 5));
    _payments.add(new BookingPayment(id: 6,title: "SucessFull", paymentDescription: "Booking of Toyota Truck with plate number was sucessfull  ", date: "12 dec w018", bookingid: 6));
    _payments.add(new BookingPayment(id: 7,title: "SucessFull", paymentDescription: "Booking of Toyota Truck with plate number was sucessfull  ", date: "12 dec w018", bookingid: 7));
    _payments.add(new BookingPayment(id: 8,title: "SucessFull", paymentDescription: "Booking of Toyota Truck with plate number was sucessfull  ", date: "12 dec w018", bookingid: 8));
    _payments.add(new BookingPayment(id: 9, title: "SucessFull",paymentDescription: "Booking of Toyota Truck with plate number was sucessfull  ", date: "12 dec w018", bookingid: 9));
    _payments.add(new BookingPayment(id: 10,title: "SucessFull", paymentDescription: "Booking of Toyota Truck with plate number was sucessfull  ", date: "12 dec w018", bookingid: 10));
  }


}