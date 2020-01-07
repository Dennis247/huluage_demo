import 'package:flutter/material.dart';
import 'package:huluage_demo/utils/uidata.dart';

class MyAboutTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AboutListTile(
      applicationIcon: FlutterLogo(
        colors: Colors.deepOrange,
      ),
      icon: FlutterLogo(
        colors: Colors.yellow,
      ),
      aboutBoxChildren: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Dennis",
        ),
        Text(
          "MTechViral",
        ),
      ],
      applicationName: UIData.appName,
      applicationVersion: "1.0.1",
      applicationLegalese: "Apache License 2.0",
    );
  }
}
