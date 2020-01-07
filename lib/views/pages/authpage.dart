import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huluage_demo/model/user.dart';
import 'package:huluage_demo/scoped_model/mainModel.dart';
import 'package:huluage_demo/views/widgets/gradient_button.dart';
import 'package:scoped_model/scoped_model.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
  };
  final TextEditingController _passwordTextController =
      new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthMode _authMode = AuthMode.Login;

  signUpBody(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[authHeader(), authFields(context)],
        ),
      );

  authHeader() => Column(
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

  authFields(BuildContext context) => Container(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                child: TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "Enter your Email",
                    labelText: "Email",
                  ),
                  // ignore: missing_return
                  validator: (String value) {
                    if (value.isEmpty ||
                        !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                            .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                  },
                  onSaved: (String value) {
                    _formData['email'] = value;
                  },
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
                  // ignore: missing_return
                  validator: (String value) {
                    if (value.isEmpty || value.length < 6) {
                      return 'Password invalid';
                    }
                  },
                ),
              ),
              _authMode == AuthMode.Login
                  ? Container()
                  : Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                      child: TextFormField(
                        maxLines: 1,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Confirm your Password",
                          labelText: "Confirm Password",
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
              ScopedModelDescendant<MainModel>(builder:
                  (BuildContext context, Widget child, MainModel model) {
                return model.isLoading == true
                    ? CircularProgressIndicator()
                    : Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 30.0),
                        width: double.infinity,
                        child: new GradientButton(
                            onPressed: () {
                              //      Navigator.pushReplacementNamed(context, '/trucks');
                              _submitForm(model.authenticate);
                            },
                            text: _authMode == AuthMode.Login
                                ? "Login"
                                : "Sign Up"),
                      );
              }),
              SizedBox(
                height: 15.0,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _authMode = _authMode == AuthMode.Login
                        ? AuthMode.SignUp
                        : AuthMode.Login;
                  });
                },
                child: Text(
                  "SWITCH TO  ${_authMode == AuthMode.Login ? "Sign Up" : "Login"}",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      );

  void _submitForm(Function authenticate) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    Map<String, dynamic> successInformation = {};

    successInformation = await authenticate(
        _formData['email'], _formData['password'], _authMode);

    if (successInformation['sucess']) {
      Navigator.pushReplacementNamed(context, '/trucks');
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
        title: Text(_authMode == AuthMode.Login ? "Login" : "Sign Up"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: signUpBody(context),
      ),
    );
  }
}
