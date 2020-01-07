import 'package:flutter/material.dart';
import 'package:huluage_demo/views/widgets/common_divider.dart';
import 'package:huluage_demo/views/widgets/common_scaffold.dart';
import 'package:huluage_demo/views/widgets/profile_tile.dart';

class HomePage extends StatelessWidget {
  var deviceSize;
  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return _scaffold();
  }

  Widget _scaffold() => CommonScaffold(
    appTitle: "HomePage",
    bodyData: bodyData(),
    showFAB: true,
    showDrawer: true,
    floatingIcon: Icons.person_add,
  );

  Widget profileColumn() => Container(
    height: deviceSize.height * 0.24,
    child: FittedBox(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ProfileTile(
              title: "Pawan Kumar",
              subtitle: "Developer",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.chat),
                    color: Colors.black,
                    onPressed: () {},
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                      new BorderRadius.all(new Radius.circular(40.0)),
                      border: new Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://avatars0.githubusercontent.com/u/12619420?s=460&v=4"),
                      foregroundColor: Colors.black,
                      radius: 30.0,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.call),
                    color: Colors.black,
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );

  Widget bodyData() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          profileColumn(),
          CommonDivider(),
        ],
      ),
    );
  }
}
