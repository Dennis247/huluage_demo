import 'package:huluage_demo/model/Driver.dart';
import 'package:scoped_model/scoped_model.dart';

mixin DriverModel on Model{
  int  _currentSelectedDriverIndex;
  List<Driver> _drivers=[];

  void setSelectedDriver(int index){
    _currentSelectedDriverIndex = index;
    notifyListeners();
  }


  int get selectedDriverIndex{
    return _currentSelectedDriverIndex;
  }

  Driver get selectedDriver{
    if(selectedDriverIndex == null){
      return null;
    }
    return _drivers[_currentSelectedDriverIndex];
  }

  List<Driver>get allDrivers{
    if(_drivers.length > 0){
      return List.from(_drivers);

    }else{
      initialiseDriverRepos();
      return List.from(_drivers);
    }

  }


  void addDriver(Driver truck){
    _drivers.add(truck);
    notifyListeners();
  }

  void updateDriver(Driver updatedDriver){

    _drivers[selectedDriverIndex] = updatedDriver;
    notifyListeners();
  }

  void deleteDriver(){
    _drivers.removeAt(_currentSelectedDriverIndex);
    notifyListeners();
  }


  void initialiseDriverRepos(){
    _drivers.add(new Driver(id: 1, name: "Fola Osula", phoneNumber: "0807847889"));
    _drivers.add(new Driver(id: 2, name: "Bukky John", phoneNumber: "0807847889"));
    _drivers.add(new Driver(id: 3, name: "Mark Fish", phoneNumber: "0807847889"));
    _drivers.add(new Driver(id: 4, name: "Paul Silas", phoneNumber: "0807847889"));
    _drivers.add(new Driver(id: 5, name: "John Fish", phoneNumber: "0807847889"));
    _drivers.add(new Driver(id: 6, name: "Jide Kosofo", phoneNumber: "0807847889"));
    _drivers.add(new Driver(id: 7, name: "Tunde Pauly", phoneNumber: "0807847889"));
    _drivers.add(new Driver(id: 8, name: "Fola Joke", phoneNumber: "0807847889"));
    _drivers.add(new Driver(id: 9, name: "Fola Oliver", phoneNumber: "0807847889"));
    _drivers.add(new Driver(id: 10, name: "Daniel Osula", phoneNumber: "0807847889"));
  }


}