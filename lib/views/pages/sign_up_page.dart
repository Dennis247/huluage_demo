import 'package:flutter/material.dart';
import 'package:huluage_demo/model/user.dart';
import 'package:huluage_demo/views/widgets/gradient_button.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
  };
  final TextEditingController _passwordTextController =
      new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthMode _authMode = AuthMode.SignUp;

  signUpBody(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[signUpHeader(), signUpFields(context)],
        ),
      );

  signUpHeader() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlutterLogo(
            colors: Colors.green,
            size: 80.0,
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "Welcome to Huluage Nigeria",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.green),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            "Sign in to continue",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );

  signUpFields(BuildContext context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Enter your username",
                  labelText: "Username",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              child: TextFormField(
                maxLines: 1,
                obscureText: true,
                controller: _passwordTextController,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  labelText: "Password",
                ),
                onSaved: (String value) {
                  _formData['password'] = value;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              child: TextFormField(
                maxLines: 1,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  labelText: "Password",
                ),
                // ignore: missing_return
                validator: (String value) {
                  if (_passwordTextController.text != value) {
                    return 'Password Do Not Match';
                  }
                },
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child: new GradientButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/trucks');
                  },
                  text: "signUp"),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "SIGN UP FOR AN ACCOUNT",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );

  void _submitForm(Function authenticate) async {
    if (!_formKey.currentState.validate() || !_formData['acceptTerms']) {
      return;
    }
    _formKey.currentState.save();
    Map<String, dynamic> successInformation = {};

    successInformation = await authenticate(
        _formData['email'], _formData['password'], _authMode);

    if (successInformation['sucess']) {
      //  Navigator.pushReplacementNamed(context, '/');
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("An Error Occured!"),
              content: Text(successInformation['message']),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Okay"))
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: signUpBody(context),
      ),
    );
  }
}
