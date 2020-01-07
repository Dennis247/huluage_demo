import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:huluage_demo/utils/uidata.dart';
import 'package:huluage_demo/views/pages/authpage.dart';
import 'package:huluage_demo/views/pages/bookings/book_truck.dart';
import 'package:huluage_demo/views/pages/bookings/booking_details.dart';
import 'package:huluage_demo/views/pages/bookings/booking_map_location.dart';
import 'package:huluage_demo/views/pages/bookings/confirm_booking.dart';
import 'package:huluage_demo/views/pages/helpcenter.dart';
import 'package:huluage_demo/views/pages/bookings/bookings.dart';
import 'package:huluage_demo/views/pages/homepage.dart';
import 'package:huluage_demo/views/pages/login.dart';
import 'package:huluage_demo/views/pages/notfoundpage.dart';
import 'package:huluage_demo/views/pages/notifications.dart';
import 'package:huluage_demo/views/pages/payments.dart';
import 'package:huluage_demo/views/pages/sign_up_page.dart';
import 'package:huluage_demo/views/pages/truckspage.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:huluage_demo/scoped_model/mainModel.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MainModel _model = new MainModel();
  bool _isAuthenticated = false;

  @override
  void initState() {
    _model.autoAuthenticate();
    _model.userSubject.listen((bool isAuthenticated) {
      setState(() {
        _isAuthenticated = isAuthenticated;
      });
    });

    super.initState();
  }

  Widget buildMaterialApp() {
    return MaterialApp(
        title: UIData.appName,
        theme: ThemeData(
          primaryColor: Colors.black,
          fontFamily: UIData.quickFont,
          primarySwatch: Colors.deepOrange,
        ),
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        routes: {
          '/': (BuildContext context) => ScopedModelDescendant(
                builder: (BuildContext context, Widget child, MainModel model) {
                  return _isAuthenticated ? TrucksPage() : AuthPage();
                },
              ),
          '/homePage': (BuildContext context) => HomePage(),
          '/bookings': (BuildContext context) =>
              _isAuthenticated ? BookingPage() : AuthPage(),
          '/trucks': (BuildContext context) =>
              _isAuthenticated ? TrucksPage() : AuthPage(),
          '/notifications': (BuildContext context) =>
              _isAuthenticated ? NotificationPage() : AuthPage(),
          '/payments': (BuildContext context) =>
              _isAuthenticated ? PaymentsPage() : AuthPage(),
          '/helpcenter': (BuildContext context) => HelpCenterPage(),
          '/booktruck': (BuildContext context) =>
              _isAuthenticated ? BookTruckPage() : AuthPage(),
          '/bookingmap': (BuildContext context) =>
              _isAuthenticated ? BookingMapLocation() : AuthPage(),
          '/confirmbooking': (BuildContext context) =>
              _isAuthenticated ? ConfirmBookingPage() : AuthPage(),
        },
        // ignore: missing_return
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'booking') {
            final int index = int.parse(pathElements[2]);
            return MaterialPageRoute<bool>(
                builder: (BuildContext context) => BookingDetailsPage(index));
          }
        },
        onUnknownRoute: (RouteSettings rs) => new MaterialPageRoute(
            builder: (context) => new NotFoundPage(
                  appTitle: UIData.coming_soon,
                  icon: FontAwesomeIcons.solidSmile,
                  title: UIData.coming_soon,
                  message: "Under Development",
                  iconColor: Colors.green,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(model: MainModel(), child: buildMaterialApp());
  }
}
