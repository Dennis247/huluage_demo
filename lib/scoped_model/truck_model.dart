import 'package:huluage_demo/model/truck.dart';
import 'package:scoped_model/scoped_model.dart';

mixin TruckModel on Model{
  int  _currentSelectedTruckIndex;
  List<Truck> _trucks=[];

  void setSelectedProduct(int index){
    _currentSelectedTruckIndex = index;
    notifyListeners();
  }

  int get selectedTruckIndex{
    return _currentSelectedTruckIndex;
  }

  Truck get selectedTruck{
    if(selectedTruckIndex == null){
      return null;
    }
    return _trucks[_currentSelectedTruckIndex];
  }

  List<Truck>get allTrucks{
    if(_trucks.length > 0){
      return List.from(_trucks);

    }else{
      initialiseTruckRepos();
      return List.from(_trucks);
    }

  }

  void addTruck(Truck truck){
    _trucks.add(truck);
    notifyListeners();
  }

  void updateTruck(Truck updatedTruck){

    _trucks[selectedTruckIndex] = updatedTruck;
    notifyListeners();
  }

  void deleteTruck(){
    _trucks.removeAt(_currentSelectedTruckIndex);
    notifyListeners();
  }


  void initialiseTruckRepos(){
    _trucks.add(new Truck(id: 1,
        truckName:"Toyota Tryck" ,
        plateNumber: "BJ947MUS",
        driverName: "Sanusi Lamido",
        truckCapacity: "9.5 tons",
        truckRating:5.0,
        truckImageUrl: "https://tdrvehicles2.azureedge.net/photos/chrome/Expanded/White/2019CHT35/2019CHT35000101.jpg-420x315"));

    _trucks.add(new Truck(id: 1,
        truckName:"Toyota Tryck" ,
        plateNumber: "BJ947MUS",
        driverName: "Sanusi Lamido",
        truckCapacity: "9.5 tons",
        truckRating:5.0,
        truckImageUrl: "https://tdrvehicles2.azureedge.net/photos/chrome/Expanded/White/2019CHT35/2019CHT35000101.jpg-420x315"));

    _trucks.add(new Truck(id: 1,
        truckName:"Toyota Tryck" ,
        plateNumber: "BJ947MUS",
        driverName: "Sanusi Lamido",
        truckCapacity: "9.5 tons",
        truckRating:5.0,
        truckImageUrl: "https://tdrvehicles2.azureedge.net/photos/chrome/Expanded/White/2019CHT35/2019CHT35000101.jpg-420x315"));


    _trucks.add(new Truck(id: 1,
        truckName:"Toyota Tryck" ,
        plateNumber: "BJ947MUS",
        driverName: "Sanusi Lamido",
        truckCapacity: "9.5 tons",
        truckRating:5.0,
        truckImageUrl: "https://tdrvehicles2.azureedge.net/photos/chrome/Expanded/White/2019CHT35/2019CHT35000101.jpg-420x315"));

    _trucks.add(new Truck(id: 1,
        truckName:"Toyota Tryck" ,
        plateNumber: "BJ947MUS",
        driverName: "Sanusi Lamido",
        truckCapacity: "9.5 tons",
        truckRating:5.0,
        truckImageUrl: "https://tdrvehicles2.azureedge.net/photos/chrome/Expanded/White/2019CHT35/2019CHT35000101.jpg-420x315"));


    _trucks.add(new Truck(id: 1,
        truckName:"Toyota Tryck" ,
        plateNumber: "BJ947MUS",
        driverName: "Sanusi Lamido",
        truckCapacity: "9.5 tons",
        truckRating:5.0,
        truckImageUrl: "https://tdrvehicles2.azureedge.net/photos/chrome/Expanded/White/2019CHT35/2019CHT35000101.jpg-420x315"));


    _trucks.add(new Truck(id: 1,
        truckName:"Toyota Tryck" ,
        plateNumber: "BJ947MUS",
        driverName: "Sanusi Lamido",
        truckCapacity: "9.5 tons",
        truckRating:5.0,
        truckImageUrl: "https://tdrvehicles2.azureedge.net/photos/chrome/Expanded/White/2019CHT35/2019CHT35000101.jpg-420x315"));

    _trucks.add(new Truck(id: 1,
        truckName:"Toyota Tryck" ,
        plateNumber: "BJ947MUS",
        driverName: "Sanusi Lamido",
        truckCapacity: "9.5 tons",
        truckRating:5.0,
        truckImageUrl: "https://tdrvehicles2.azureedge.net/photos/chrome/Expanded/White/2019CHT35/2019CHT35000101.jpg-420x315"));


    _trucks.add(new Truck(id: 1,
        truckName:"Toyota Tryck" ,
        plateNumber: "BJ947MUS",
        driverName: "Sanusi Lamido",
        truckCapacity: "9.5 tons",
        truckRating:5.0,
        truckImageUrl: "https://tdrvehicles2.azureedge.net/photos/chrome/Expanded/White/2019CHT35/2019CHT35000101.jpg-420x315"));


    _trucks.add(new Truck(id: 1,
        truckName:"Toyota Tryck" ,
        plateNumber: "BJ947MUS",
        driverName: "Sanusi Lamido",
        truckCapacity: "9.5 tons",
        truckRating:5.0,
        truckImageUrl: "https://tdrvehicles2.azureedge.net/photos/chrome/Expanded/White/2019CHT35/2019CHT35000101.jpg-420x315"));


  }


}