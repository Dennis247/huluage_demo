import 'package:flutter/material.dart';
import 'package:huluage_demo/model/truck.dart';
import 'package:huluage_demo/scoped_model/mainModel.dart';
import 'package:huluage_demo/scoped_model/truck_model.dart';
import 'package:huluage_demo/views/widgets/common_scaffold.dart';
import 'package:huluage_demo/views/widgets/profile_tile.dart';
import 'package:huluage_demo/views/widgets/cards/truck_card.dart';
import 'package:scoped_model/scoped_model.dart';

class TrucksPage extends StatelessWidget {
  var deviceSize;
  Widget _buildProductList( List<Truck> trucks){
    Widget truckCardsView = Center(child: Text("There are currently no trucks in the list"),);
    if(trucks.length > 0){
      truckCardsView = ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemBuilder: (BuildContext context,int index)=>TruckCard(trucks[index],index),
        itemCount: trucks.length,
      );
    }
    return truckCardsView;
  }

  Widget _scaffold() => CommonScaffold(
    appTitle: "Trucks Available",
    bodyData: bodyData(),
    showFAB: false,
    showDrawer: true,
    floatingIcon: null

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
    return ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child,TruckModel model){
      return  _buildProductList(model.allTrucks);
    },) ;
  }


  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return _scaffold();
  }
}
