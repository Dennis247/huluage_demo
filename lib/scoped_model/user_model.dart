import 'dart:async';
import 'package:huluage_demo/model/truck.dart';
import 'package:huluage_demo/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

mixin UserModel on Model {
  List<Truck> _availableTrucks = [];
  User _authenticatedUser;
  final String url = "https://truck-loading-15eee.firebaseio.com/";
  final String apiKey = "AIzaSyCiPS2nUPIcqQ3Ppm50M19_L00YMrQPgK8";
  final String truckslink = "https://truck-loading-15eee.firebaseio.com/trucks";
  //int  _currentSelectedTruckIndex;
  String _currentSelectedtruckId;
  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  PublishSubject<bool> _userSubject = PublishSubject();
  Timer _authTimer;
  User currentuser;
  User get user {
    return _authenticatedUser;
  }

  PublishSubject<bool> get userSubject {
    return _userSubject;
  }

  Future<Map<String, dynamic>> authenticate(String email, String password,
      [AuthMode mode = AuthMode.Login]) async {
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    http.Response response;
    if (mode == AuthMode.Login) {
      response = await http.post(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$apiKey",
        body: json.encode(authData),
        headers: {'Content-Type': 'application/json'},
      );
    } else {
      response = await http.post(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$apiKey",
        body: json.encode(authData),
        headers: {'Content-Type': 'application/json'},
      );
    }

    // ignore: unused_local_variable
    String message = "Something went wrong";
    // ignore: unused_local_variable
    bool hasError = true;
    final Map<String, dynamic> responseData = json.decode(response.body);
    if (responseData.containsKey('idToken')) {
      hasError = false;
      message = "Authentication Succceeded";
      _authenticatedUser = new User(
          id: responseData["localId"],
          email: email,
          token: responseData["idToken"]);
      //emit event that user has been authenticate
      _userSubject.add(true);
      setAuthTimeOut(int.parse(responseData['expiresIn']));
      final DateTime now = DateTime.now();
      final expiryTime =
          now.add(Duration(seconds: int.parse(responseData["expiresIn"])));
      _userSubject.add(true);
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      preferences.setString('token', responseData['idToken']);
      preferences.setString('userEmail', email);
      preferences.setString('userId', responseData['localId']);
      preferences.setString('expiryTime', expiryTime.toIso8601String());
    } else if (responseData['error']['message'] == "EMAIL_NOT_FOUND") {
      message = "Email Not Found";
      hasError = true;
    } else if (responseData['error']['message'] == "INVALID_PASSWORD") {
      message = "Password is not Valid";
      hasError = true;
    } else if (responseData['error']['message'] == "EMAIL_EXISTS") {
      message = "The email already exists";
      hasError = true;
    }
    _isLoading = false;
    notifyListeners();
    return {'sucess': !hasError, 'message': message};
  }

  void autoAuthenticate() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String token = preferences.get('token');
    final String expiryTimeString = preferences.get('expiryTime');
    final expiryTime = DateTime.parse(expiryTimeString);
    if (token != null) {
      final DateTime now = DateTime.now();
      if (expiryTime.isBefore(now)) {
        _authenticatedUser = null;
        notifyListeners();
        return;
      }
      final String userEmail = preferences.getString('userEmail');
      final String userId = preferences.getString('userId');
      final int tokenLifeSpan = expiryTime.difference(now).inSeconds;
      currentuser = new User(id: userId, email: userEmail, token: token);
      _userSubject.add(true);
      setAuthTimeOut(tokenLifeSpan);
      notifyListeners();
    }
  }

  void logOut() async {
    print("i have logged out");
    _authenticatedUser = null;
    _authTimer.cancel();
    final SharedPreferences preference = await SharedPreferences.getInstance();
    preference.remove('token');
    preference.remove('userEmail');
    preference.remove('userId');

    //This shows a user has logged out
    _userSubject.add(false);
  }

  void setAuthTimeOut(int time) async {
    _authTimer = Timer(Duration(seconds: time), () {
      logOut();
    });
  }
}
