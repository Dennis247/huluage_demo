import 'package:huluage_demo/scoped_model/booking_model.dart';
import 'package:huluage_demo/scoped_model/bookingpayment_model.dart';
import 'package:huluage_demo/scoped_model/driver_model.dart';
import 'package:huluage_demo/scoped_model/notification_model.dart';
import 'package:huluage_demo/scoped_model/truck_model.dart';
import 'package:huluage_demo/scoped_model/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model
    with
        UserModel,
        TruckModel,
        BookingModel,
        NotificationModel,
        DriverModel,
        BookingPaymentModel {}
